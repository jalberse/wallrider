/// @description
if (global.pause == 1) {
	// pauses animation and halts for pause
	image_speed = 0;
	exit;
}
image_speed = 1;
if (place_meeting(x, y, obj_enemy)){
	with (instance_nearest(x, y, obj_enemy)) {
		var start_time = current_time;
		instance_destroy(); // destroys the enemy
		spawn_drops(x,y,num_small_drops,num_large_drops);
		while (current_time < start_time + 50) { ; } // hit pause
		// TODO: Trigger explosion animation here
	}
}