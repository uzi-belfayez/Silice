#include "config.h"
#include "std.h"
#include "oled.h"
#include "display.h"
#include "printf.h"
#include "sdcard.h"

// include the fat32 library
#include "fat_io_lib/src/fat_filelib.h"

#define MAX_FILES        32
#define MAX_FILENAME_LEN 64

// Nombre max d’éléments affichés simultanément à l’écran.
// Tu peux ajuster si besoin (4, 5, 6…)
#define MAX_VISIBLE_ITEMS 7

// Structure to store file information
typedef struct {
  char filename[MAX_FILENAME_LEN];
  int  size;
} FileEntry;

FileEntry files[MAX_FILES];
int n_items = 0;



// Function to scan and store all files
void scan_files() {
  n_items = 0;
  const char *path = "/";
  FL_DIR dirstat;

  if (fl_opendir(path, &dirstat)) {
    struct fs_dir_ent dirent;
    while (fl_readdir(&dirstat, &dirent) == 0 && n_items < MAX_FILES) {
      if (!dirent.is_dir) {
        // Copy filename
        int i = 0;
        while (dirent.filename[i] && i < MAX_FILENAME_LEN - 1) {
          files[n_items].filename[i] = dirent.filename[i];
          i++;
        }
        files[n_items].filename[i] = '\0';
        files[n_items].size = dirent.size;
        n_items++;
      }
    }
    fl_closedir(&dirstat);
  }
}

void clear_audio()
{
  // wait for a buffer swap (sync)
  int *addr = (int*)(*AUDIO);
  while (addr == (int*)(*AUDIO)) { }
  // go ahead
  for (int b=0 ; b<2 ; ++b) {
    // read directly in hardware buffer
    addr = (int*)(*AUDIO);
    // clear buffer
    memset(addr,0,512);
    // wait for buffer swap
    while (addr == (int*)(*AUDIO)) { }
  }
}


void play_click_noise(){

  FL_FILE *f = fl_fopen("/click.raw","rb");
}




void main()
{
  int selected     = 0;  // index de l’élément sélectionné
  int pulse        = 0;
  int prev_buttons = 0;
  int top          = 0;  // index du premier élément visible (fenêtre de scroll)

  // turn LEDs off
  *LEDS = 0;

  // install putchar handler for printf
  f_putchar = display_putchar;

  // init screen
  oled_init();
  oled_fullscreen();
  oled_clear(0);

  // init sdcard
  sdcard_init();

  // initialise File IO Library
  fl_init();

  // attach media access functions to library
  display_set_cursor(0,0);
  display_set_front_back_color(255,0);
  printf("Initializing SD card...\n");
  display_refresh();

  while (fl_attach_media(sdcard_readsector, sdcard_writesector) != FAT_INIT_OK) {
    // keep trying, we need this
  }

  // Scan files once at startup
  scan_files();

  // Main menu loop
  while(1) {

    // PAS de oled_clear ici → on évite le clignotement

    // Repart du haut de l’écran à chaque frame
    display_set_cursor(0,0);

    // Pulsing header (comme dans ton code original)
    display_set_front_back_color((pulse+127)&255, pulse);
    pulse += 7;
    printf("    ===== files =====    \n\n");

    // Affichage des fichiers
    display_set_front_back_color(255,0);
    if (n_items == 0) {

      printf("No files found!\n");

    } else {

      // Combien d’éléments sont réellement visibles à partir de 'top'
      int visible = n_items - top;
      if (visible > MAX_VISIBLE_ITEMS) {
        visible = MAX_VISIBLE_ITEMS;
      }

      for (int line = 0; line < visible; ++line) {
        int i = top + line;  // index réel dans le tableau 'files'

        if (i == selected) {
          // Highlight selected item
          display_set_front_back_color(0, 255);
        } else {
          display_set_front_back_color(255, 0);
        }

        printf("%d> %s\n", i, files[i].filename);
        printf("   [%d bytes]\n", files[i].size);
      }
    }

    display_refresh();

    // Read buttons with debouncing
    int curr_buttons = *BUTTONS;
    int button_press = curr_buttons & ~prev_buttons; // Detect rising edge

    // Mapping d’ORIGINE :
    // bit 3 → descendre (selected++)
    // bit 4 → monter   (selected--)
    if (button_press & (1<<4)) { 
      selected++;
    }
    if (button_press & (1<<3)) { 
      selected--;
    }

    if (n_items > 0) {
      // Wrap de la sélection
      if (selected < 0) {
        selected = n_items - 1;
        play_click_noise();
      }
      if (selected >= n_items) {
        selected = 0;
        play_click_noise();
      }

      // Ajuster la fenêtre de scroll pour que 'selected' reste visible
      if (selected < top) {
        top = selected;
      } else if (selected >= top + MAX_VISIBLE_ITEMS) {
        top = selected - (MAX_VISIBLE_ITEMS - 1);
      }

      // Bornes pour 'top'
      if (top < 0) {
        top = 0;
      }
      int max_top = (n_items > MAX_VISIBLE_ITEMS) ? (n_items - MAX_VISIBLE_ITEMS) : 0;
      if (top > max_top) {
        top = max_top;
      }

    } else {
      // Aucun fichier : on reste à 0
      selected = 0;
      top      = 0;
    }

    prev_buttons = curr_buttons;
  }
}