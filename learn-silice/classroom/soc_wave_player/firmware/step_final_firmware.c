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
    fl_fseek(f, 800, SEEK_SET);
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
// FILE VIEWERS
// -----------------------------------------------------------------------

void view_image_file(const char* full_path) {
    FL_FILE *f = fl_fopen(full_path, "rb");
    if (!f) return;

    fl_fread((void*)display_framebuffer(), 1, 128*128, f);
    fl_fclose(f);
    display_refresh();

    int prev_btns = *BUTTONS;
    while (1) {
        int curr_btns = *BUTTONS;
        int pressed = curr_btns & ~prev_btns; 
        if (pressed & ( (1<<1) | (1<<2) )) { // Button 1 or Action to exit
            play_click_noise();
            break;
        }
        prev_btns = curr_btns;
    }
    memset((void*)display_framebuffer(), 0, 128*128);
    display_refresh();
}

void play_music_file(const char* full_path) {
    FL_FILE *f = fl_fopen(full_path, "rb");
    if (f == NULL) {
        display_set_front_back_color(255,0);
        printf("Err: %s\n", full_path);
        display_refresh();
        for(int w=0; w<200000; w++) asm("nop");
        return; 
    }

    display_set_cursor(0,0);
    display_set_front_back_color(255,0);
    printf("Playing: %s           \n", full_path);
    display_refresh();

    int prev_btns = *BUTTONS; 
    int leds = 1;
    int dir = 0;
    
    while (1) {
        int *addr = (int*)(*AUDIO);
        int sz = fl_fread(addr,1,512,f);
        if (sz < 512) memset((unsigned char*)addr + sz, 0, 512 - sz);
        while (addr == (int*)(*AUDIO)) { }
        if (sz < 512) break;

        if (leds == 128 || leds == 1) { dir = 1-dir; }
        if (dir) leds <<= 1; else leds >>= 1;
        *LEDS = leds;

        int curr_btns = *BUTTONS;
        if (curr_btns & ~prev_btns) {
            play_click_noise(); 
            break;
        }
        prev_btns = curr_btns; 
    }
    fl_fclose(f);
    clear_audio();
    *LEDS = 0;
    memset((void*)display_framebuffer(), 0, 128*128);
    display_refresh();
}

// -----------------------------------------------------------------------
// SCANNING
// -----------------------------------------------------------------------

void scan_files() {
  n_items = 0;
  static FL_DIR dirstat;
  static struct fs_dir_ent dirent;

  if (strcmp(current_path, "/") != 0) {
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

// -----------------------------------------------------------------------
// HELPER FOR GOING BACK UP A DIRECTORY
// -----------------------------------------------------------------------
void go_up_directory() {
    int len = 0; while(current_path[len]) len++;
    if (len > 1) { 
        current_path[len-1] = '\0';
        char *last_slash = strrchr(current_path, '/');
        if (last_slash) *(last_slash + 1) = '\0'; 
        else strcpy(current_path, "/");
    }
}

// -----------------------------------------------------------------------
// MODES
// -----------------------------------------------------------------------

void file_explorer() {
    scan_files();
    int selected = 0;
    int top = 0;
    int prev_buttons = 0;
    int pulse = 0;

    while(1) {
        display_set_cursor(0,0);
        display_set_front_back_color((pulse+127)&255, pulse);
        pulse += 7;
        printf(" FILES: ");
        // Print path truncated
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
                int chars_printed = 0;
                for(int k=0; k < max_chars && name[k]; k++) {
                    f_putchar(name[k]); chars_printed++;
                }
                while (chars_printed < max_chars) {
                    f_putchar(' '); chars_printed++;
                }
                f_putchar('\n'); 
            }
            // Clear rest
            display_set_front_back_color(0,0);
            for(int k=visible; k<MAX_VISIBLE_ITEMS; k++) printf("                     \n"); 
        }
        display_refresh();

        int curr_buttons = *BUTTONS;
        int button_press = curr_buttons & ~prev_buttons; 

        // Down (Bit 4) / Up (Bit 3)
        if (button_press & (1<<4)) { selected++; play_click_noise(); }
        if (button_press & (1<<3)) { selected--; play_click_noise(); }

        // BACK BUTTON (Button 1 / Left)
        if (button_press & (1<<1)) { 
             play_click_noise();
             // If at root, exit to Main Menu
             if (strcmp(current_path, "/") == 0) {
                 return; 
             } else {
                 go_up_directory();
                 selected = 0; top = 0;
                 scan_files();
                 memset((void*)display_framebuffer(), 0, 128*128);
             }
        }

        // ACTION BUTTON (Bit 2)
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
                selected = 0; top = 0;
                scan_files();
                memset((void*)display_framebuffer(), 0, 128*128);
            } else {
                char full_path[MAX_PATH_LEN];
                strcpy(full_path, current_path);
                char *p = full_path; while(*p) p++;
                char *src = f->filename; while(*src) *p++ = *src++;
                *p = '\0';
                if (f->size == 16384) view_image_file(full_path);
                else                  play_music_file(full_path);
            }
        }

        // Wrap
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

void not_implemented(const char *msg) {
    oled_clear(0);
    display_set_cursor(0,40);
    printf("   %s\n", msg);
    display_set_cursor(0,60);
    printf("  Coming Soon!\n");
    display_refresh();
    
    // Wait for button press to return
    while (*BUTTONS == 0); 
    while (*BUTTONS != 0); 
    play_click_noise();
}

// -----------------------------------------------------------------------
// MAIN MENU
// -----------------------------------------------------------------------

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
            printf("\n"); // Double spacing
        }
        
        display_set_front_back_color(255,0);
        display_set_cursor(0, 110);
        printf("Select & Press Btn");
        
        display_refresh();

        int curr_buttons = *BUTTONS;
        int pressed = curr_buttons & ~prev_buttons;

        if (pressed & (1<<4)) { selected++; play_click_noise(); } // Down
        if (pressed & (1<<3)) { selected--; play_click_noise(); } // Up

        // Action (Bit 2)
        if (pressed & (1<<2)) {
            play_click_noise();
            if (selected == 0) {
                file_explorer();
            } else if (selected == 1) {
                not_implemented("Play Songs");
            } else if (selected == 2) {
                not_implemented("DJ Mode");
            }
            // Clear screen when returning from any mode
            memset((void*)display_framebuffer(), 0, 128*128);
        }

        if (selected < 0) selected = num_options - 1;
        if (selected >= num_options) selected = 0;

        prev_buttons = curr_buttons;
    }
}

// -----------------------------------------------------------------------
// MAIN
// -----------------------------------------------------------------------

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
  
  // Jump to Main Menu loop
  main_menu();
}