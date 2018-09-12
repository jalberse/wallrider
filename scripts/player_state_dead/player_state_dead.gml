if (state_new) {
	invincible = true;
	yv = -10;
	state_var[0] = 5;
	sprite_index = spr_player_hit;
	audio_stop_sound(background_music);
	audio_play_sound(death,1,0);
}

// Fall
if (place_meeting(x + xv, y, obj_wall)){
	while (!place_meeting(x + sign(xv), y, obj_wall)) x = x + sign(xv);
	xv = 0; // kill momentum in case we go below wall
}
else x = x + xv;
if (yv >= 0) yv = yv + grv * down_grv_factor;
else yv = yv + grv;
if (place_meeting(x, y + yv, obj_wall)){
	while (!place_meeting(x, y + sign(yv), obj_wall)) {
		y = y + sign(yv); 
	}
}
else {
	y = y + yv;
}

// Flash
if (state_timer % state_var[0] == 0 && image_alpha == 1) image_alpha = 0;
else if (state_timer % state_var[0] == 0) image_alpha = 1;

// Spawn transition to game over screen
if (state_timer == death_frames) {
	instance_create_layer(0,0,effects_layer,obj_game_over_transition);
}

// Game over actually after 12 frames of transition
if (state_timer >= death_frames + 12 * 4) game_over()