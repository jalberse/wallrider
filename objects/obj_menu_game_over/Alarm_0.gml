/// @description Handles adding to process strings
var snare_hit = false;
for (var i = 0; i < array_length_1d(stats_labels); i++){
	if (stats_labels[i] != stats_labels_new[i]) {
		stats_labels_new[i] += string_char_at(stats_labels[i],char_index);
		if (!snare_hit) {
			audio_play_sound(snare,1,false);
			snare_hit = true; // don't play multiple times per round of characters
		}
	}
	if (stats_labels[i] == stats_labels_new[i]) {
		// We finished writing out - now, display appropriate stat
		draw_stat_flags[i] = true;
	}
}
char_index++;
var are_all_equal = true;
for (i = 0; i < array_length_1d(stats_labels); i++){
	if (stats_labels[i] != stats_labels_new[i]) {
		are_all_equal = false;
		break;
	}
}
// We are done drawing text - draw the stats now
if (are_all_equal) {
	alarm[1] = 10;
}
else alarm[0] = 6;