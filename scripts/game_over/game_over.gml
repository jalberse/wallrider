//@description 
// Save the HIGH SCORES
ini_open("save.ini"); 
var high_score_old = ini_read_real("high_scores","high_score",0);
if (high_score_old < score) {
	ini_write_real("high_scores","high_score",score);
	ini_write_real("old_scores","high_score",high_score_old); //store the old high score for comparing on game over scrn
}
high_score_old = ini_read_real("high_scores","highest_combo",0);
if (high_score_old < highest_combo) {
	ini_write_real("high_scores","highest_combo",highest_combo);
	ini_write_real("old_scores","highest_combo",high_score_old);
}
high_score_old = ini_read_real("high_scores","time",0);
if (high_score_old < time) {
	ini_write_real("high_scores","time",time);
	ini_write_real("old_scores","time",high_score_old);
}

// Save the stats from the game that was just played
ini_write_real("scores","score",score);
ini_write_real("scores","highest_combo",highest_combo);
ini_write_real("scores","time",time);

ini_close();

// Go to the game over screen
room_goto_next();