/// @description
if (show_controls = 1) {
	if (keyboard_check_released(vk_anykey)) show_controls = 0;
}
else{
	var move = 0;
	move -= max(keyboard_check_pressed(vk_up),keyboard_check_pressed(ord("W")),0);
	move += max(keyboard_check_pressed(vk_down),keyboard_check_pressed(ord("S")),0);
	
	cursor_pos += move;
	if (cursor_pos > array_length_1d(menu) - 1) cursor_pos = 0;
	else if (cursor_pos < 0) cursor_pos = array_length_1d(menu) - 1;
	
	var select = 0;
	select = max(keyboard_check_released(ord("M")),keyboard_check_released(vk_enter),keyboard_check_released(vk_space),0);
	
	// Select an item
	if (select == 1) {
		switch (cursor_pos) {
			case 0: // START
			{
				cursor_pos = 0;
				audio_stop_sound(main_menu_music);
				room_goto_next();
				break;
			}
			case 1: // CONTROLS
			{
				cursor_pos = 0;
				show_controls = 1;
				break;
			}
			case 2: // QUIT
			{
				game_end();
				break;
			}
			default: break;
		}
	}
}
