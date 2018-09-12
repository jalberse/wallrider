/// @description
global.pause = 0;

x = display_get_gui_width() / 2;
y = display_get_gui_height() / 2;

cursor_pos = 0;
space = 64; // space between lines
show_controls = 0;

menu[0] = "RESUME";
menu[1] = "CONTROLS";
menu[2] = "EXIT TO MENU";
menu[3] = "QUIT";

for (i = 0; i < array_length_1d(menu); i++) {
	y_menu_pos[i] = y + space * i + 8;
}



