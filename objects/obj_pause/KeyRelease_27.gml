/// @description 

if (global.pause == 1) {
	if (show_controls == 0) global.pause = 0;
}
else {
	if (room != main_menu) global.pause = 1;
}