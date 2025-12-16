#include "config.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
#include "sdcard.h"

// include the fat32 library
#include "fat_io_lib/src/fat_filelib.h"

#define MAX_FILES        64
#define MAX_FILENAME_LEN 100
#define MAX_PATH_LEN     500
#define MAX_VISIBLE_ITEMS 12

// -----------------------------------------------------------------------
// MISSING STRING FUNCTIONS (Added for Bare Metal Support)
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
// END STRING FUNCTIONS
// -----------------------------------------------------------------------

// Structure to store file information
typedef struct {
  char filename[MAX_FILENAME_LEN];
  int  size;
  int  is_dir; // 1 if directory, 0 if file
} FileEntry;

FileEntry files[MAX_FILES];
int n_items = 0;
char current_path[MAX_PATH_LEN] = "/"; // Start at root


// Function to scan files in the current directory
// Function to scan files in the current directory
// Function to scan files in the current directory
void scan_files() {
  n_items = 0;
  
  static FL_DIR dirstat;
  static struct fs_dir_ent dirent;

  // Clear the whole dirstat/dirent manually if needed, but the loop below handles the files array
  
  // 1. Handle ".."
  if (strcmp(current_path, "/") != 0) {
      memset(files[n_items].filename, 0, MAX_FILENAME_LEN); // CLEAN MEMORY
      strcpy(files[n_items].filename, "..");
      files[n_items].size = 0;
      files[n_items].is_dir = 1;
      n_items++;
  }

  // 2. Open directory
  if (fl_opendir(current_path, &dirstat)) {
    while (fl_readdir(&dirstat, &dirent) == 0 && n_items < MAX_FILES) {
      if (strcmp(dirent.filename, ".") == 0) continue;
      if (strcmp(dirent.filename, "..") == 0) continue;

      // CLEAN MEMORY before copying
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
    // Note: Always play from root or absolute path
    FL_FILE *f = fl_fopen("/click.raw", "rb");
    if (!f) return;

    // Skip silence at start
    fl_fseek(f, 4000, SEEK_SET);

    while (1) {
        int *addr = (int*)(*AUDIO);
        int sz = fl_fread(addr, 1, 512, f);
        if (sz < 512) {
            memset((unsigned char*)addr + sz, 0, 512 - sz);
        }
        while (addr == (int*)(*AUDIO)) { }
        if (sz < 512) break;
    }
    fl_fclose(f);
    clear_audio();
}

// Function to play a specific music file
void play_music_file(const char* full_path) {
    FL_FILE *f = fl_fopen(full_path, "rb");
    if (f == NULL) {
        printf("Error: Cannot open %s\n", full_path);
        display_refresh();
        return; 
    }

    display_set_cursor(0,0);
    display_set_front_back_color(255,0);
    printf("Playing: %s           \n", full_path);
    display_refresh();

    // --- FIX: Don't wait for release. Just track the state. ---
    int prev_btns = *BUTTONS; 

    int leds = 1;
    int dir = 0;
    
    while (1) {
        int *addr = (int*)(*AUDIO);
        int sz = fl_fread(addr,1,512,f);
        
        if (sz < 512) { 
             memset((unsigned char*)addr + sz, 0, 512 - sz);
        }

        while (addr == (int*)(*AUDIO)) { }
        
        if (sz < 512) break;

        // Visuals
        if (leds == 128 || leds == 1) { dir = 1-dir; }
        if (dir) leds <<= 1; else leds >>= 1;
        *LEDS = leds;

        // --- FIX: Check for NEW press only (Rising Edge) ---
        int curr_btns = *BUTTONS;
        int pressed   = curr_btns & ~prev_btns; // Only bits that went 0->1
        
        if (pressed) {
            play_click_noise(); // Acknowledge stop
            break;
        }
        prev_btns = curr_btns; // Update state
    }
    
    fl_fclose(f);
    clear_audio();
    *LEDS = 0;
}

void main()
{
  int selected     = 0; 
  int pulse        = 0;
  int prev_buttons = 0;
  int top          = 0; 

  *LEDS = 0;
  f_putchar = display_putchar;

  oled_init();
  oled_fullscreen();
  oled_clear(0);
  sdcard_init();
  fl_init();

  display_set_cursor(0,0);
  display_set_front_back_color(255,0);
  printf("Init SD card...\n");
  display_refresh();

  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) { }

  // Initial Scan
  scan_files();

  while(1) {
    display_set_cursor(0,0);

    // Header (Takes ~16 pixels height)
    display_set_front_back_color((pulse+127)&255, pulse);
    pulse += 7;
    // Truncate path in header too if it gets too long!
    printf(" DIR: ");
    for(int k=0; k<15 && current_path[k]; k++) f_putchar(current_path[k]);
    f_putchar('\n');

    display_set_front_back_color(255,0);
    if (n_items == 0) {
      printf("Empty directory!\n");
    } else {
      int visible = n_items - top;
      if (visible > MAX_VISIBLE_ITEMS) visible = MAX_VISIBLE_ITEMS;

      for (int line = 0; line < visible; ++line) {
          int i = top + line;
          
          if (i == selected) display_set_front_back_color(0, 255);
          else display_set_front_back_color(255, 0);

          // Print Prefix
          if (files[i].is_dir) printf("[%d] ", i);
          else                 printf("%d> ", i);

          // --- FIX: Print name AND erase the rest of the line with spaces ---
          char *name = files[i].filename;
          int max_chars = 18; 
          int chars_printed = 0;

          // Print the name char by char
          for(int k=0; k < max_chars && name[k]; k++) {
              f_putchar(name[k]);
              chars_printed++;
          }

          // Fill the rest of the line with spaces to erase old text!
          while (chars_printed < max_chars) {
              f_putchar(' ');
              chars_printed++;
          }
          
          f_putchar('\n'); 
        }
      
      // Clear the rest of the screen (lines below the list)
      // This removes "ghosts" from previous directory listings
      display_set_front_back_color(0,0);
      for(int k=visible; k<MAX_VISIBLE_ITEMS; k++) {
          printf("                     \n"); // Print empty line
      }
    }
    
    // Call display_refresh() only once at the end
    display_refresh();

    int curr_buttons = *BUTTONS;
    int button_press = curr_buttons & ~prev_buttons; 

    // --- Navigation ---
    if (button_press & (1<<4)) { // Down
      selected++;
      play_click_noise();
    }
    if (button_press & (1<<3)) { // Up
      selected--;
      play_click_noise();
    }

    // --- Action (Enter/Select) ---
    // Check your board's button mapping. 
    // Usually bit 2 is the 'right' or 'action' button.
    if (button_press & (1<<2)) { 
        play_click_noise();

        FileEntry *f = &files[selected];

        if (f->is_dir) {
            // It is a directory
            if (strcmp(f->filename, "..") == 0) {
                // GO BACK
                int len = 0; 
                while(current_path[len]) len++;
                
                if (len > 1) { 
                    // Remove trailing slash
                    current_path[len-1] = '\0';
                    // Find new last slash
                    char *last_slash = strrchr(current_path, '/');
                    if (last_slash) {
                        *(last_slash + 1) = '\0'; // Cut after the slash
                    } else {
                        // Should not happen if logic is correct
                        strcpy(current_path, "/");
                    }
                }
            } else {
                // GO IN
                int len = 0; while(current_path[len]) len++;
                int file_len = 0; while(f->filename[file_len]) file_len++;
                
                if (len + file_len + 2 < MAX_PATH_LEN) {
                    strcat(current_path, f->filename);
                    strcat(current_path, "/");
                }
            }
            
            // Re-scan
            selected = 0;
            top = 0;
            scan_files();
            oled_clear(0); 

        } else {
            // It is a file -> Play it!
            char full_path[MAX_PATH_LEN];
            
            int p_len = 0; while(current_path[p_len]) p_len++;
            int f_len = 0; while(f->filename[f_len]) f_len++;
            
            if (p_len + f_len < MAX_PATH_LEN) {
                strcpy(full_path, current_path);
                strcat(full_path, f->filename);
                play_music_file(full_path);
            }
        }
    }

    // --- Wrapping logic ---
    if (n_items > 0) {
      if (selected < 0) selected = n_items - 1;
      if (selected >= n_items) selected = 0;

      if (selected < top) top = selected;
      else if (selected >= top + MAX_VISIBLE_ITEMS) top = selected - (MAX_VISIBLE_ITEMS - 1);
      
      if (top < 0) top = 0;
      int max_top = (n_items > MAX_VISIBLE_ITEMS) ? (n_items - MAX_VISIBLE_ITEMS) : 0;
      if (top > max_top) top = max_top;
    } else {
      selected = 0; top = 0;
    }

    prev_buttons = curr_buttons;
  }
}