/// @description
draw_sprite(spr_game_over_border,0,0,0);

// Draw static text and menu options
draw_set_color(c_white);
draw_set_font(fnt_menu_large);
draw_text(display_get_gui_width() * .45, display_get_gui_height() * .28, "GAME OVER");

// DRAW the cursor
if (cursor_pos % 2 == 0) draw_sprite(spr_cursor,image_index,menu_location_x,y_menu_pos[cursor_pos]);
else draw_sprite_ext(spr_cursor,image_index,menu_location_x,y_menu_pos[cursor_pos],-1,1,0,c_white,1);
// DRAW the text
var i;
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
for (i = 0; i < array_length_1d(menu); i++){
	if (i == cursor_pos) {
		draw_set_font(fnt_menu_large)
		draw_text(menu_location_x, y_menu_pos[i] - 14, string(menu[i]));
		draw_set_font(fnt_menu);
	}
	else draw_text(menu_location_x, y_menu_pos[i] - 14, string(menu[i]));
}
draw_set_halign(fa_left);

// Draw stats characters
var y_base = 300;
var x_base = 128;
var space = 72;
var pink = make_color_rgb(238,20,91); //TODO- table lookup for game's color pallete may be useful

draw_set_color(pink);
draw_set_font(fnt_menu);
draw_set_halign(fa_left);
for (var i = 0; i < array_length_1d(stats_labels_new); i++){
	draw_text(x_base, y_base + space * i, stats_labels_new[i]);
}

// draw the actual stat number if done drawing all characters
if (draw_stats){
	// draw high scores
	draw_text(x_base + 220, y_base + space * 0, high_stats[0]);
	draw_text(x_base + 290, y_base + space * 1, high_stats[1]);
	draw_text(x_base + 210, y_base + space * 2, high_stats[2]);
	
	// draw stats from last game
	draw_set_font(fnt_menu_large);
	draw_set_color(c_white);
	x_base += 124;
	y_base += 32;
	for (i = 0; i < array_length_1d(draw_stat_flags); i++) {
		draw_set_font(fnt_menu_large);
		draw_text(x_base + 16 * i,y_base + space * i, string(stats[i]));
		if (is_new_best[i]){
			draw_set_font(fnt_menu_small);
			draw_sprite_ext(spr_new_best_back,anim_frame,x_base + 16*i - 18, y_base + space*i + 16,power(-1,i),1,0,pink,1);
			anim_frame+=.08;
			draw_text(x_base + 16 * i - 132,y_base + space * i + 8, "NEW BEST!");
		}
	}
}
