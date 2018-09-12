/// @description

// kinematics
if (distance_to_object(obj_player) < 64){
	chase_player = true;
}
if (chase_player) {
	x += (obj_player.x - x) / 8;
	y += (obj_player.y - y) / 8;
}
else {
	if (place_meeting(x + xv,y,obj_wall)){
		while(!place_meeting(x + sign(xv),y,obj_wall)){
			x = x + sign(xv);
		}
		xv = xv;
	}
	else x = x + xv;
	yv += grv;
	y += yv;
}

// Drop "tracer", which together form the tail
// TODO: Look into if this can be done cheaper w/ a shader
// TODO: Failing that, object-pooling for these
instance_create_layer(x,y,effects_layer,obj_drop_tracer)

// Handle if picked up
if (place_meeting(x,y,obj_player)){
	score += value;
	with (obj_player) {
		combo++;
		if (combo > highest_combo) highest_combo = combo;
	}
	instance_destroy();
}

// Handle timer
if (timer++ == lifespan) {
	instance_destroy();
}