// Switches next_state for spawners ONLY IF NECESSARY

if (state_timer >= split_time && current_wave < array_length_1d(waves) - 1){
	current_wave++; // Move onto the next wave
	// Reach end of waves batch - generate a new one and start over
	if (current_wave >= WAVES_MAX) {
		current_wave = 0;
		spawner_state_batch_gen();
	}
	state_switch(waves[current_wave]);
	switching = true;
}
else switching = false;