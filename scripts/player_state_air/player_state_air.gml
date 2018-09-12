if (state_new) {
	if (yv == -jumpsp) sprite_index = spr_player_jump;
	else sprite_index = spr_player_air_one;
	state_var[1] = score; // The score when we enter the state
}
// SHOOT
if (shoot_held && obj_gun.ammo > 0 && obj_gun.shoot_timer >= obj_gun.cooldown){
	// This should call script_execute so the gun's current state can determine how firing works
	with (obj_gun){
		// fire the gun as defined by current state
		ammo--;
		// Spawn ammo effect
		var offset = floor((ammo / 3) * 64) - floor(ammo / 3) * 7;
		if (ammo % 3 == 0) instance_create_layer(x,y + 58 + offset,effects_layer,obj_ammo_fx_0);
		if (ammo % 3 == 1) instance_create_layer(x,y + 38 + offset,effects_layer,obj_ammo_fx_1);
		if (ammo % 3 == 2) instance_create_layer(x,y + 19 + offset,effects_layer,obj_ammo_fx_2);
		
		shoot_timer = 0;
		obj_camera.shake = gun_shake;
		instance_create_layer(obj_player.x, obj_player.y + 32, bullets_layer, ds_map_find_value(bullet_types,state_name));
	}
	if (yv < 0 ) {
		// If we are moving up, don't stop upward momentum, just accelerate
		yv = yv + obj_gun.recoil; 
	}
	else yv = obj_gun.recoil; // Stops downward momentum totally; design decision
	sprite_index = spr_player_fire;
}
else if (shoot_held&& obj_gun.ammo < 1 && obj_gun.shoot_timer >= obj_gun.cooldown
		&& !instance_exists(obj_empty)){
	var x_loc = random_range(-20,20);
	instance_create_layer(x + x_loc,y - 32,effects_layer,obj_empty);
}
with (obj_gun) {
	if (shoot_timer < cooldown || shoot_timer < shoot_sprite_hold) shoot_timer++;
}

// HORIZONTAL KINEMATICS
var dir = right_held - left_held; // direction of horizontal movement
if (abs(xv + (xa * dir)) < xv_max) xv = xv + (xa * dir);
// Horizontal collision
if (place_meeting(x + xv, y, obj_wall)){
	// Note: Multiply by 5 because we want to be 5 pixels from wall, as sprite is 5 pixels
	// larger than collision box
	while (!place_meeting(x + sign(xv) * 5, y, obj_wall)){
		x = x + sign(xv); // move to meet wall
	}
	// If wall is invisible, do not wallride
	if (instance_nearest(x,y,obj_wall).image_alpha != 0) {
		state_switch("WALLRIDE", false); // push = false because there is no situation where we revert
		update_highest_combo()
	}
}
else{
	x = x + xv;
}

// VERT KINEMATICS
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

// Get hit (or not). Switches to state_hit if hit
player_handle_hit();

// SPRITE DETERMINATION
if (obj_gun.shoot_timer < obj_gun.shoot_sprite_hold && sprite_index == spr_player_fire) sprite_index = spr_player_fire;
else if (yv < 0 && sprite_index == spr_player_jump) sprite_index = spr_player_jump;
else if (yv < 0) sprite_index = spr_player_air_one;
else if (yv < 5) sprite_index = spr_player_air_two;
else sprite_index = spr_player_air_three;

// Red tracer if combo is sufficiently high
if (score - state_var[1] > tracer_combo_start) {
	if (obj_gun.shoot_timer < obj_gun.shoot_sprite_hold && sprite_index == spr_player_fire) {
		var inst = instance_create_layer(x,y,effects_layer,obj_player_tracer)
		with (inst) {
			player_tracer_init(4);
		}
	}
	else if (yv < 0) {
		var inst = instance_create_layer(x,y,effects_layer,obj_player_tracer)
		with (inst) {
			player_tracer_init(1);
		}
	}
	else if (yv < 5) {
		var inst = instance_create_layer(x,y,effects_layer,obj_player_tracer)
		with (inst) {
			player_tracer_init(2);
		}
	}
	else {
		var inst = instance_create_layer(x,y,effects_layer,obj_player_tracer)
		with (inst) {
			player_tracer_init(3);
		}
	}
}


if (sprite_index != spr_player_jump){
	if (xv < 0) image_xscale = -1;
	else image_xscale = 1;
}

if (y > room_height) state_switch("DEAD",false);