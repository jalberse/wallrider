/// @description

// --------------------------//
//    Handle drawing stats   //
// --------------------------//
// TODO: We should package each stat into an object to be displayed
//       which is easier to manage/change than having to set every field manually
draw_stats = false; // draw the numbers - true once all text drawn
alarm[0] = 6; // Timer for stats labels


ini_open("save.ini");
high_stats[0] = ini_read_real("high_scores","high_score",0);
high_stats[1] = ini_read_real("high_scores","highest_combo",0);
high_stats[2] = ini_read_real("high_scores","time",0);
// Gets the old high scores (that is, if we just beat them, these are the old ones)
// We don't display these, just for comparing to current score
old_high_stats[0] = ini_read_real("old_scores","high_score",0);
old_high_stats[1] = ini_read_real("old_scores","highest_combo",0);
old_high_stats[2] = ini_read_real("old_scores","time",0);
// Gets the stats for the last game
stats[0] = ini_read_real("scores","score",0);
stats[1] = ini_read_real("scores","highest_combo",0);
stats[2] = ini_read_real("scores","time",0);
ini_close();

// Flag if each stat has a new high score
for (var i = 0; i < array_length_1d(stats); i++){
	is_new_best[i] = false;
	if (stats[i] == high_stats[i]) {
		is_new_best[i] = true;
	}
}

// calculate time display
seconds_total = stats[2] div room_speed;
minutes = seconds_total div 60;
seconds = seconds_total - minutes * 60;
if (seconds > 9) time_str = string(minutes) + ":" + string(seconds)
else time_str = string(minutes) + ":0" + string(seconds)
stats[2] = time_str;
seconds_total = high_stats[2] div room_speed;
minutes = seconds_total div 60;
seconds = seconds_total - minutes * 60;
if (seconds > 9) time_str = string(minutes) + ":" + string(seconds)
else time_str = string(minutes) + ":0" + string(seconds)
high_stats[2] = time_str;


// process strings are placeholder strings which we display
// adding one character every alarm[0] steps
// until it matches the actual string - we then stop adding
// and display the appropriate data as well, eg score
char_index = 1; // it's not 0-indexed..... come on
stats_labels[0] = "High Score";
stats_labels_new[0] = "";
draw_stat_flags[0] = false;
stats_labels[1] = "Highest combo";
stats_labels_new[1] = "";
draw_stat_flags[1] = false;
stats_labels[2] = "Best Time"
stats_labels_new[2] = "";
draw_stat_flags[2] = false;

// Set up menu options
menu_location_x = display_get_gui_width() * .65;
menu_location_y = display_get_gui_height() * .6;
cursor_pos = 0; // pos on menu, not screen coordinates {0,1,2...}
space = 64;  // space between options

menu[0] = "REPLAY";
menu[1] = "MAIN MENU";
menu[2] = "QUIT";

// Tracks y position of each menu choice
for (i = 0; i < array_length_1d(menu); i++){
	y_menu_pos[i] = menu_location_y + space * i + 8;
}

anim_frame = 0; // for new best sprite