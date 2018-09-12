/// @description
if (global.pause == 0) exit; // don't run if not paused
if (show_controls == 1) {
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
	
	if (select == 1) {
		switch (cursor_pos) {
			case 0: // START
			{
				global.pause = 0;
				cursor_pos = 0;
				break;
			}
			case 1: // CONTROLS
			{
				show_controls = 1;
				cursor_pos = 0;
				break;
			}
			case 2: // QUIT TO MENU
			{
				audio_stop_sound(background_music);
				audio_play_sound(main_menu_music,1,1);
				room_goto(0);
				cursor_pos = 0;
				break;
			}
			case 3 : // QUIT GAME
			{
				game_end();
				cursor_pos = 0;
				break;
			}
			default: break;
		}
	}
}