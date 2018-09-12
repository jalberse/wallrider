/// @description
if (!audio_is_playing(main_menu_music)) audio_play_sound(main_menu_music,1,1);
global.pause = 0;

randomize();

x = display_get_gui_width() / 2;
y = display_get_gui_height() / 3 * 2;

cursor_pos = 0; // pos on menu
space = 64;  // space between options
show_controls = 0;

menu[0] = "START";
menu[1] = "CONTROLS";
menu[2] = "QUIT";

// Tracks y position of each menu choice
for (i = 0; i < array_length_1d(menu); i++){
	y_menu_pos[i] = y + space * i + 8;
}

// TODO: Having a spawner in the main menu screen would be fun
//       eg having enemies, power-ups float by. Nice polish