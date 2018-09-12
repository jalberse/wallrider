/// @description 
if (global.pause == 0) exit;

draw_set_alpha(.5);
draw_set_color(c_gray);
draw_rectangle(0, 0, 1024, 768, 0);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fnt_menu);

if (show_controls == 1) {
	script_execute(draw_controls);
}
// draw the main menu
else{
	// DRAW the cursor
	if (cursor_pos % 2 == 0) draw_sprite(spr_cursor,image_index,x,y_menu_pos[cursor_pos]);
	else draw_sprite_ext(spr_cursor,image_index,x,y_menu_pos[cursor_pos],-1,1,0,c_red,1);
	// DRAW the text
	var i;
	for (i = 0; i < array_length_1d(menu); i++){
		if (i == cursor_pos) {
			draw_set_font(fnt_menu_large)
			draw_text(x, y_menu_pos[i] - 14, string(menu[i]));
			draw_set_font(fnt_menu);
		}
		else draw_text(x, y_menu_pos[i] - 14, string(menu[i]));
	}
}