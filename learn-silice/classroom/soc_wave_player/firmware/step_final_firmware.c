#include "config.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
#include "sdcard.h"

// include the fat32 library
#include "fat_io_lib/src/fat_filelib.h"

// --- CONFIGURATION ---
#define MAX_FILES        64
#define MAX_FILENAME_LEN 100
#define MAX_PATH_LEN     500
#define MAX_VISIBLE_ITEMS 12

// How many bytes to skip per loop when seeking
#define SEEK_SPEED       8192 

// -----------------------------------------------------------------------
// STRING FUNCTIONS
// -----------------------------------------------------------------------

int strcmp(const char *s1, const char *s2) {
    while (*s1 && (*s1 == *s2)) {
        s1++;
        s2++;
    }
    return *(const unsigned char *)s1 - *(const unsigned char *)s2;
}

char *strrchr(const char *s, int c) {
    const char *last = 0;
    do {
        if (*s == (char)c)
            last = s;
    } while (*s++);
    return (char *)last;
}

int starts_with(const char *str, const char *prefix) {
    while(*prefix) {
        if(*prefix++ != *str++) return 0;
    }
    return 1;
}

void strcat_custom(char *dest, const char *src) {
    while (*dest) dest++;
    while (*src) *dest++ = *src++;
    *dest = '\0';
}

void *memcpy_custom(void *dest, const void *src, int n) {
    char *d = (char *)dest;
    const char *s = (const char *)src;
    while (n--) *d++ = *s++;
    return dest;
}

// -----------------------------------------------------------------------
// GLOBAL VARIABLES
// -----------------------------------------------------------------------

typedef struct {
  char filename[MAX_FILENAME_LEN];
  int  size;
  int  is_dir; 
} FileEntry;

FileEntry files[MAX_FILES];
int n_items = 0;
char current_path[MAX_PATH_LEN] = "/"; 

// -----------------------------------------------------------------------
// AUDIO HELPERS
// -----------------------------------------------------------------------

void clear_audio()
{
  int *addr = (int*)(*AUDIO);
  while (addr == (int*)(*AUDIO)) { }
  for (int b=0 ; b<2 ; ++b) {
    addr = (int*)(*AUDIO);
    memset(addr,0,512);
    while (addr == (int*)(*AUDIO)) { }
  }
}

void play_click_noise() {
    FL_FILE *f = fl_fopen("/click.raw", "rb");
    if (!f) return;
    fl_fseek(f, 4500, SEEK_SET);
    while (1) {
        int *addr = (int*)(*AUDIO);
        int sz = fl_fread(addr, 1, 512, f);
        if (sz < 512) memset((unsigned char*)addr + sz, 0, 512 - sz);
        while (addr == (int*)(*AUDIO)) { }
        if (sz < 512) break;
    }
    fl_fclose(f);
    clear_audio();
}

// -----------------------------------------------------------------------
// UI LOGIC (FIXED)
// -----------------------------------------------------------------------

void update_player_ui(int percent, char *status_text, char *track_name) {
    unsigned char* fb = (unsigned char*)display_framebuffer();
    
    // 1. CLEAR FOOTER
    for (int y = 105; y < 128; y++) {
        for (int x = 0; x < 128; x++) {
            fb[y*128 + x] = 0; 
        }
    }

    // 2. DRAW PROGRESS BAR
    int bar_y_start = 110;
    int bar_y_end   = 114;
    int bar_x_start = 10;
    int bar_x_end   = 118;
    int max_width   = bar_x_end - bar_x_start;

    // Outline
    for (int y = bar_y_start; y <= bar_y_end; y++) {
        for (int x = bar_x_start; x <= bar_x_end; x++) {
             if (y == bar_y_start || y == bar_y_end || x == bar_x_start || x == bar_x_end) {
                 fb[y*128 + x] = 255; 
             }
        }
    }

    // Fill (Right to Left)
    int fill_width = (max_width * percent) / 100;
    if (fill_width > max_width) fill_width = max_width;

    for (int y = bar_y_start + 1; y < bar_y_end; y++) {
        for (int x = bar_x_end - fill_width; x < bar_x_end; x++) {
             if (x > bar_x_start) fb[y*128 + x] = 255; 
        }
    }

    // 3. DRAW TEXT (Strict Overwrite)
    display_set_cursor(10, 118); 
    display_set_front_back_color(255, 0); 
    
    int chars_printed = 0;

    if (status_text[0] != '\0') {
        // Print Status
        char *p = status_text;
        while(*p) { f_putchar(*p++); chars_printed++; }
    } else {
        // Print Song Name
        f_putchar('>'); f_putchar(' '); chars_printed += 2;
        for(int i=0; i<12 && track_name[i]; i++) {
            f_putchar(track_name[i]);
            chars_printed++;
        }
    }
    
    // Eraser Padding
    while(chars_printed < 16) {
        f_putchar(' ');
        chars_printed++;
    }
}

// --- LED DANCER ---
int led_pos = 1;
int led_dir = 0; 

void update_led_dance(unsigned char *buffer, int size) {
    unsigned int energy = 0;
    for (int i = 4; i < size; i+=4) {
        int diff = (int)buffer[i] - (int)buffer[i-4];
        if (diff < 0) diff = -diff;
        energy += diff;
    }

    if (energy > 800) { 
        if (led_pos == 128 || led_pos == 1) { led_dir = 1 - led_dir; }
        if (led_dir) led_pos = led_pos << 1;
        else         led_pos = led_pos >> 1;
        if (led_pos < 1) led_pos = 1;
        if (led_pos > 128) led_pos = 128;
        *LEDS = led_pos;
    } 
}

// -----------------------------------------------------------------------
// PLAYER FUNCTIONS
// -----------------------------------------------------------------------

int play_music_with_controls(const char* full_path, const char* filename, int total_size) {
    
    // Clear screen RAM completely to avoid glitches
    memset((void*)display_framebuffer(), 0, 128*128);
    
    char cover_path[MAX_PATH_LEN];
    strcpy(cover_path, "/imgs/");
    strcat_custom(cover_path, filename);

    FL_FILE *img = fl_fopen(cover_path, "rb");
    if (img) {
        fl_fread((void*)display_framebuffer(), 1, 128*128, img);
        fl_fclose(img);
    } else {
        display_set_cursor(30, 50);
        display_set_front_back_color(255,0);
        printf("No Cover");
    }

    FL_FILE *f = fl_fopen(full_path, "rb");
    if (f == NULL) return 0;

    update_player_ui(0, "", (char*)filename);
    display_refresh();

    int prev_btns = *BUTTONS; 
    int current_pos = 0;
    int is_paused = 0;
    int update_counter = 0; 
    int ret_code = 0; 
    int b2_hold_timer = 0;
    unsigned char temp_buf[512]; 

    while (1) {
        int *addr = (int*)(*AUDIO); 

        if (is_paused) {
            memset(addr, 0, 512); 
            *LEDS = 0; 
            while (addr == (int*)(*AUDIO)) { } 
        } else {
            int sz = fl_fread(temp_buf, 1, 512, f);
            if (sz < 512) for(int k=sz; k<512; k++) temp_buf[k] = 0;
            
            update_led_dance(temp_buf, 512);
            memcpy_custom(addr, temp_buf, 512);
            while (addr == (int*)(*AUDIO)) { } 

            current_pos += sz;
            if (sz < 512) { ret_code = 1; break; }
        }

        update_counter++;
        if (update_counter > 20) { 
            update_counter = 0;
            int pct = (total_size > 0) ? (current_pos * 100) / total_size : 0;
            if (is_paused) update_player_ui(pct, "|| PAUSED", (char*)filename);
            else           update_player_ui(pct, "", (char*)filename);
            display_refresh(); 
        }

        int curr_btns = *BUTTONS;
        
        // SEEKING
        if (curr_btns & (1<<5)) { // REW
            current_pos -= SEEK_SPEED;
            if (current_pos < 0) current_pos = 0;
            fl_fseek(f, current_pos, SEEK_SET);
            update_player_ui((total_size > 0) ? (current_pos*100)/total_size : 0, "<< REWIND", (char*)filename);
            display_refresh();
        }
        if (curr_btns & (1<<6)) { // FF
            current_pos += SEEK_SPEED;
            if (current_pos >= total_size) { ret_code = 1; break; }
            fl_fseek(f, current_pos, SEEK_SET);
            update_player_ui((total_size > 0) ? (current_pos*100)/total_size : 0, ">> FAST", (char*)filename);
            display_refresh();
        }

        int pressed = curr_btns & ~prev_btns; 
        if (pressed & (1<<1)) { play_click_noise(); ret_code = 0; break; } 
        if (pressed & (1<<3)) { ret_code = -1; break; } 
        if (pressed & (1<<4)) { ret_code = 1;  break; }

        // PAUSE/RESTART
        if (curr_btns & (1<<2)) {
            b2_hold_timer++;
            if (b2_hold_timer == 30) {
                 play_click_noise();
                 fl_fseek(f, 0, SEEK_SET);
                 current_pos = 0;
                 is_paused = 0;
                 update_player_ui(0, "RESTART", (char*)filename);
                 display_refresh();
                 clear_audio(); 
                 while(*BUTTONS & (1<<2)) { asm("nop"); }
                 b2_hold_timer = 0; 
            }
        } else {
            if (b2_hold_timer > 0 && b2_hold_timer < 30) {
                is_paused = !is_paused;
                int pct = (total_size > 0) ? (current_pos * 100) / total_size : 0;
                if(is_paused) update_player_ui(pct, "|| PAUSED", (char*)filename);
                else          update_player_ui(pct, "", (char*)filename);
                display_refresh();
            }
            b2_hold_timer = 0;
        }
        prev_btns = curr_btns;
    }
    fl_fclose(f);
    clear_audio();
    *LEDS = 0; 
    return ret_code;
}

// -----------------------------------------------------------------------
// DJ MODE (STUTTER / PITCH / SCRATCH)
// -----------------------------------------------------------------------

void play_dj_mode(const char* full_path, const char* filename, int total_size) {
    // Clear RAM buffer first
    memset((void*)display_framebuffer(), 0, 128*128);
    
    char cover_path[MAX_PATH_LEN];
    strcpy(cover_path, "/imgs/");
    strcat_custom(cover_path, filename);
    FL_FILE *img = fl_fopen(cover_path, "rb");
    if (img) {
        fl_fread((void*)display_framebuffer(), 1, 128*128, img);
        fl_fclose(img);
    } else {
        display_set_front_back_color(255,0);
        display_set_cursor(35, 50); printf("DJ MODE");
    }

    FL_FILE *f = fl_fopen(full_path, "rb");
    if (f == NULL) return;

    // UI Initial Draw
    display_set_cursor(10, 118); 
    display_set_front_back_color(255, 0); 
    update_player_ui(0, "DJ READY", (char*)filename);
    display_refresh();

    int prev_btns = *BUTTONS; 
    int current_pos = 0;
    int update_counter = 0; 
    
    // DJ STATE
    int pitch_mode = 0; 
    unsigned char raw_buf[1024]; 
    unsigned char final_buf[512];

    while (1) {
        int *addr = (int*)(*AUDIO); 
        int curr_btns = *BUTTONS;

        // --- 1. STUTTER EFFECT (B2 HOLD) ---
        if (curr_btns & (1<<2)) {
            update_led_dance(final_buf, 512);
            memcpy_custom(addr, final_buf, 512);
            while (addr == (int*)(*AUDIO)) { } 
            
            update_counter++;
            if (update_counter > 10) {
                update_player_ui((current_pos*100)/total_size, "STUTTER!!", (char*)filename);
                display_refresh();
                update_counter = 0;
            }
            continue; 
        }

        // --- 2. AUDIO PROCESSING (PITCH) ---
        int bytes_to_read = 512;
        if (pitch_mode == 1) bytes_to_read = 1024; // Fast
        if (pitch_mode == -1) bytes_to_read = 256; // Slow

        int sz = fl_fread(raw_buf, 1, bytes_to_read, f);
        
        if (sz < bytes_to_read) {
            fl_fseek(f, 0, SEEK_SET);
            current_pos = 0;
            continue; 
        }
        current_pos += sz;

        if (pitch_mode == 0) {
            memcpy_custom(final_buf, raw_buf, 512);
        } 
        else if (pitch_mode == 1) {
            for(int i=0; i<512; i++) final_buf[i] = raw_buf[i*2];
        } 
        else if (pitch_mode == -1) {
            for(int i=0; i<256; i++) {
                final_buf[i*2] = raw_buf[i];
                final_buf[i*2+1] = raw_buf[i];
            }
        }

        // --- 3. OUTPUT & LEDS ---
        update_led_dance(final_buf, 512);
        memcpy_custom(addr, final_buf, 512);
        while (addr == (int*)(*AUDIO)) { } 

        // --- 4. CONTROLS ---
        int pressed = curr_btns & ~prev_btns;

        if (pressed & (1<<1)) { play_click_noise(); break; }
        if (pressed & (1<<3)) { pitch_mode = 1; }
        if (pressed & (1<<4)) { pitch_mode = -1; }
        if (pressed & (1<<6)) { pitch_mode = 0; }

        if (curr_btns & (1<<5)) {
            current_pos -= 16384; 
            if (current_pos < 0) current_pos = 0;
            fl_fseek(f, current_pos, SEEK_SET);
            update_player_ui((current_pos*100)/total_size, "<< SPIN", (char*)filename);
            display_refresh();
        }

        update_counter++;
        if (update_counter > 20) {
            update_counter = 0;
            int pct = (total_size > 0) ? (current_pos * 100) / total_size : 0;
            
            char *txt = "";
            if (pitch_mode == 1) txt = "FAST 2X";
            else if (pitch_mode == -1) txt = "SLOW 0.5X";
            else txt = "";
            
            update_player_ui(pct, txt, (char*)filename);
            display_refresh();
        }
        prev_btns = curr_btns;
    }
    fl_fclose(f);
    clear_audio();
    *LEDS = 0;
}

// -----------------------------------------------------------------------
// FILE VIEWERS & BROWSERS
// -----------------------------------------------------------------------

void view_image_file(const char* full_path) {
    // Clear screen RAM
    memset((void*)display_framebuffer(), 0, 128*128);
    display_refresh();

    FL_FILE *f = fl_fopen(full_path, "rb");
    if (!f) return;
    fl_fread((void*)display_framebuffer(), 1, 128*128, f);
    fl_fclose(f);
    display_refresh();
    
    int prev_btns = *BUTTONS;
    for(int i=0; i<10000; i++) asm("nop"); 
    while (1) {
        int curr_btns = *BUTTONS;
        int pressed = curr_btns & ~prev_btns; 
        if (pressed & ( (1<<1) | (1<<2) )) { play_click_noise(); break; }
        prev_btns = curr_btns;
    }
    memset((void*)display_framebuffer(), 0, 128*128);
    display_refresh();
}

void scan_files(const char* virtual_root) {
  n_items = 0;
  static FL_DIR dirstat;
  static struct fs_dir_ent dirent;

  if (strcmp(current_path, virtual_root) != 0) {
      memset(files[n_items].filename, 0, MAX_FILENAME_LEN);
      strcpy(files[n_items].filename, "..");
      files[n_items].size = 0;
      files[n_items].is_dir = 1;
      n_items++;
  }

  if (fl_opendir(current_path, &dirstat)) {
    while (fl_readdir(&dirstat, &dirent) == 0 && n_items < MAX_FILES) {
      if (strcmp(dirent.filename, ".") == 0) continue;
      if (strcmp(dirent.filename, "..") == 0) continue;
      memset(files[n_items].filename, 0, MAX_FILENAME_LEN);
      int i = 0;
      while (dirent.filename[i] && i < MAX_FILENAME_LEN - 1) {
        files[n_items].filename[i] = dirent.filename[i];
        i++;
      }
      files[n_items].filename[i] = '\0';
      files[n_items].size = dirent.size;
      files[n_items].is_dir = dirent.is_dir; 
      n_items++;
    }
    fl_closedir(&dirstat);
  }
}

void go_up_directory() {
    int len = 0; while(current_path[len]) len++;
    if (len > 1) { 
        current_path[len-1] = '\0';
        char *last_slash = strrchr(current_path, '/');
        if (last_slash) { *(last_slash + 1) = '\0'; } 
        else { strcpy(current_path, "/"); }
    } else { strcpy(current_path, "/"); }
}

void build_full_path(char *dest, const char *filename) {
    strcpy(dest, current_path);
    char *p = dest; while(*p) p++;
    char *src = (char*)filename; while(*src) *p++ = *src++;
    *p = '\0';
}

// -----------------------------------------------------------------------
// MENUS
// -----------------------------------------------------------------------

void file_explorer() {
    // Clear RAM buffer
    memset((void*)display_framebuffer(), 0, 128*128);
    display_refresh();
    
    strcpy(current_path, "/");
    scan_files("/");
    int selected = 0;
    int top = 0;
    int prev_buttons = 0;
    int pulse = 0;

    while(1) {
        display_set_cursor(0,0);
        display_set_front_back_color((pulse+127)&255, pulse);
        pulse += 7;
        printf(" FILES: ");
        for(int k=0; k<12 && current_path[k]; k++) f_putchar(current_path[k]);
        f_putchar('\n');

        display_set_front_back_color(255,0);
        if (n_items == 0) {
            printf("Empty!\n");
        } else {
            int visible = n_items - top;
            if (visible > MAX_VISIBLE_ITEMS) visible = MAX_VISIBLE_ITEMS;
            for (int line = 0; line < visible; ++line) {
                int i = top + line;
                if (i == selected) display_set_front_back_color(0, 255);
                else display_set_front_back_color(255, 0);

                if (files[i].is_dir) printf("[%d] ", i);
                else                 printf("%d> ", i);

                char *name = files[i].filename;
                int max_chars = 18; 
                for(int k=0; k < max_chars && name[k]; k++) f_putchar(name[k]);
                f_putchar('\n'); 
            }
            display_set_front_back_color(0,0);
            for(int k=visible; k<MAX_VISIBLE_ITEMS; k++) printf("                     \n"); 
        }
        display_refresh();

        int curr_buttons = *BUTTONS;
        int button_press = curr_buttons & ~prev_buttons; 

        if (button_press & (1<<4)) { selected++; play_click_noise(); } // Down
        if (button_press & (1<<3)) { selected--; play_click_noise(); } // Up

        if (button_press & (1<<1)) { 
             play_click_noise();
             if (strcmp(current_path, "/") == 0) return; 
             go_up_directory();
             selected = 0; top = 0; scan_files("/");
             memset((void*)display_framebuffer(), 0, 128*128);
        }

        if (button_press & (1<<2)) { 
            play_click_noise();
            FileEntry *f = &files[selected];
            if (f->is_dir) {
                if (strcmp(f->filename, "..") == 0) {
                    go_up_directory();
                } else {
                    char *p = current_path; while(*p) p++;
                    char *src = f->filename; while(*src) *p++ = *src++;
                    *p++ = '/'; *p = '\0';
                }
                selected = 0; top = 0; scan_files("/");
                memset((void*)display_framebuffer(), 0, 128*128);
            } else {
                char full_path[MAX_PATH_LEN];
                build_full_path(full_path, f->filename);
                if (f->size == 16384) view_image_file(full_path);
                else                  play_music_with_controls(full_path, f->filename, f->size);
                
                memset((void*)display_framebuffer(), 0, 128*128);
                prev_buttons = *BUTTONS; 
            }
        }
        if (n_items > 0) {
            if (selected < 0) selected = n_items - 1;
            if (selected >= n_items) selected = 0;
            if (selected < top) top = selected;
            else if (selected >= top + MAX_VISIBLE_ITEMS) top = selected - (MAX_VISIBLE_ITEMS - 1);
            if (top < 0) top = 0;
        }
        prev_buttons = curr_buttons;
    }
}

void music_player_generic(int is_dj_mode) {
    // Clear RAM buffer
    memset((void*)display_framebuffer(), 0, 128*128);
    display_refresh();

    strcpy(current_path, "/albums/");
    scan_files("/albums/");
    int selected = 0;
    int top = 0;
    int prev_buttons = 0;
    int pulse = 0;

    while(1) {
        display_set_cursor(0,0);
        display_set_front_back_color((pulse+127)&255, pulse);
        pulse += 7;
        if(is_dj_mode) printf(" DJ SEL: ");
        else           printf(" MUSIC:  ");
        
        for(int k=0; k<12 && current_path[k]; k++) f_putchar(current_path[k]);
        f_putchar('\n');

        display_set_front_back_color(255,0);
        if (n_items == 0) {
            printf("Empty!\n");
        } else {
            int visible = n_items - top;
            if (visible > MAX_VISIBLE_ITEMS) visible = MAX_VISIBLE_ITEMS;
            for (int line = 0; line < visible; ++line) {
                int i = top + line;
                if (i == selected) display_set_front_back_color(0, 255);
                else display_set_front_back_color(255, 0);

                if (files[i].is_dir) printf("[%d] ", i);
                else                 printf("%d> ", i);

                char *name = files[i].filename;
                int max_chars = 18; 
                for(int k=0; k < max_chars && name[k]; k++) f_putchar(name[k]);
                f_putchar('\n'); 
            }
            display_set_front_back_color(0,0);
            for(int k=visible; k<MAX_VISIBLE_ITEMS; k++) printf("                     \n"); 
        }
        display_refresh();

        int curr_buttons = *BUTTONS;
        int button_press = curr_buttons & ~prev_buttons; 

        if (button_press & (1<<4)) { selected++; play_click_noise(); } // Down
        if (button_press & (1<<3)) { selected--; play_click_noise(); } // Up

        if (button_press & (1<<1)) { 
             play_click_noise();
             if (strcmp(current_path, "/albums/") == 0) return;
             go_up_directory();
             if (starts_with(current_path, "/albums/") == 0) strcpy(current_path, "/albums/");
             selected = 0; top = 0; scan_files(current_path);
             memset((void*)display_framebuffer(), 0, 128*128);
        }

        if (button_press & (1<<2)) { 
            play_click_noise();
            FileEntry *f = &files[selected];
            if (f->is_dir) {
                if (strcmp(f->filename, "..") == 0) {
                    go_up_directory();
                    if (starts_with(current_path, "/albums/") == 0) strcpy(current_path, "/albums/");
                } else {
                    char *p = current_path; while(*p) p++;
                    char *src = f->filename; while(*src) *p++ = *src++;
                    *p++ = '/'; *p = '\0';
                }
                selected = 0; top = 0; scan_files(current_path);
                memset((void*)display_framebuffer(), 0, 128*128);
            } else {
                int play_index = selected;
                while(1) {
                    FileEntry *track = &files[play_index];
                    if (track->is_dir) {
                        play_index++; 
                        if (play_index >= n_items) play_index = 0;
                        if (play_index == selected) break; 
                        continue;
                    }
                    char full_path[MAX_PATH_LEN];
                    build_full_path(full_path, track->filename);
                    
                    // CLEAR SCREEN BEFORE PLAYER
                    memset((void*)display_framebuffer(), 0, 128*128);
                    display_refresh();

                    if (is_dj_mode) {
                        play_dj_mode(full_path, track->filename, track->size);
                        break; 
                    } else {
                        int action = play_music_with_controls(full_path, track->filename, track->size);
                        if (action == 0) break; 
                        else if (action == 1) { play_index++; if(play_index>=n_items) play_index=0; } 
                        else if (action == -1) { play_index--; if(play_index<0) play_index=n_items-1; }
                    }
                }
                memset((void*)display_framebuffer(), 0, 128*128);
                prev_buttons = *BUTTONS; 
            }
        }
        if (n_items > 0) {
            if (selected < 0) selected = n_items - 1;
            if (selected >= n_items) selected = 0;
            if (selected < top) top = selected;
            else if (selected >= top + MAX_VISIBLE_ITEMS) top = selected - (MAX_VISIBLE_ITEMS - 1);
            if (top < 0) top = 0;
        }
        prev_buttons = curr_buttons;
    }
}

void main_menu() {
    const char *options[] = {
        "File Explorer",
        "Play Songs",
        "DJ Mode"
    };
    int selected = 0;
    int num_options = 3;
    int prev_buttons = 0;

    while (1) {
        display_set_cursor(0,0);
        display_set_front_back_color(255,0);
        printf("=== MAIN MENU ===\n\n");

        for(int i=0; i<num_options; i++) {
            if(i == selected) display_set_front_back_color(0, 255);
            else              display_set_front_back_color(255, 0);
            printf(" %d. %s       \n", i+1, options[i]);
            printf("\n"); 
        }
        
        display_set_front_back_color(255,0);
        display_set_cursor(0, 110);
        printf("Select & Press Btn");
        display_refresh();

        int curr_buttons = *BUTTONS;
        int pressed = curr_buttons & ~prev_buttons;

        if (pressed & (1<<4)) { selected++; play_click_noise(); } 
        if (pressed & (1<<3)) { selected--; play_click_noise(); } 

        if (pressed & (1<<2)) {
            play_click_noise();
            
            // FIX: WIPE RAM + REFRESH
            memset((void*)display_framebuffer(), 0, 128*128);
            display_refresh();
            
            if (selected == 0)      file_explorer(); 
            else if (selected == 1) music_player_generic(0); 
            else if (selected == 2) music_player_generic(1); 
            
            memset((void*)display_framebuffer(), 0, 128*128);
            prev_buttons = *BUTTONS;
        }

        if (selected < 0) selected = num_options - 1;
        if (selected >= num_options) selected = 0;

        prev_buttons = curr_buttons;
    }
}

void main()
{
  *LEDS = 0;
  f_putchar = display_putchar;
  oled_init();
  oled_fullscreen();
  memset((void*)display_framebuffer(), 0, 128*128);
  display_refresh();

  sdcard_init();
  fl_init();

  display_set_cursor(0,0);
  display_set_front_back_color(255,0);
  printf("Init SD card...\n");
  display_refresh();

  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) { }
  
  main_menu();
}