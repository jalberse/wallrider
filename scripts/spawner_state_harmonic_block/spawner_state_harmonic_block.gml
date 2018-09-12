if (state_new){
	// Enter method
	sprite_index = spr_spawner_line;
	state_var[0] = random_range(400, room_width - 400); // Determine x location of enemies (center)
	state_var[1] = 3; // Number of Columns
}

// Spawns STATE_VAR[1] number of enemies, spread evenly over split_time
if ((state_timer + (split_time / (state_var[1] + 1))) % (split_time / (state_var[1] + 1)) == 0 && state_timer != split_time){
	for (i = 0; i < 3; i++){
		with (instance_create_layer(state_var[0] + (i - 1) * 100, room_height + 64, enemies_layer, obj_enemy)){
			sprite_index = spr_ghost;
			ai_component = cos_path;
			xv = .02;
			x_offset = x;
		}
	}
}

// Moves onto next wave if necessary and able
spawner_switch();