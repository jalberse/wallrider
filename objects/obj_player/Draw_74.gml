/// @description Health, score, etc\
var y_base = 64;
var x_base = display_get_gui_width() - 48;
// Draw the empty hearts
draw_hearts(0,hp_max, y_base, x_base);
// Draw the full hearts over top
draw_hearts(1,hp, y_base, x_base);
// Draw the score
draw_set_font(fnt_menu);
draw_text(display_get_gui_width() / 2, 16, string(score));