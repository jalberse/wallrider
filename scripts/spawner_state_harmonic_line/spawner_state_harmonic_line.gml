if (state_new){
	// Enter method
	sprite_index = spr_spawner_line;
	state_var[0] = random_range(200, room_width - 200); // Determine x location of enemies
	state_var[1] = 3; // NUMBER OF ENEMIES
}

// Spawns STATE_VAR[1] number of enemies, spread evenly over split_time
if ((state_timer + (split_time / (state_var[1] + 1))) % (split_time / (state_var[1] + 1)) == 0 && state_timer != split_time){
	with (instance_create_layer(state_var[0], room_height + 64, enemies_layer, obj_enemy)){
		sprite_index = spr_ghost;
		ai_component = cos_path;
		xv = .02;
	}
}

// Moves onto next wave if necessary and able
spawner_switch();