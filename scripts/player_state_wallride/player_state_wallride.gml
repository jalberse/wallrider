if (state_new)
{
	xv = 0;
	sprite_index = spr_player_wallride;
	with (obj_gun) {
		shoot_timer = cooldown;
		ammo = ammo_max;
	}
	// TODO: Reload. Needs to be a method in gun state machine
	state_var[0] = 0; // right_held or left_held timer timer
	if (place_meeting(x - 5, y, obj_wall)) { // 5 because sprite is bigger than collision box by 5 pix
		state_var[1] = true; // TRUE if on left wall, FALSE if on right wall
		image_xscale = 1;
	}
	else {
		state_var[1] = false; //on right wall
		image_xscale = -1;
	}
}
if (right_released || left_released) state_var[0] = 0;

// VERT KINEMATICS
var move_dir = down_held - up_held;
// Gravity
yv = yv + grv;
// Handle wall friction
if (yv > 0) {
	// Moving down the wall - friction acts up
	yv = yv - fr;
}
else {
	// Stationary or moving up the wall - friction acts down
	yv = yv + fr;
}
// User input
yv = yv + move_dir * ya;

// Move the player
x = x + xv;
y = y + yv;

// STATE SWITCHES
// Jump off the wall
if (jump_pressed) {
	yv = -jumpsp;
	if (state_var[1]) xv = jumpsp / tan_jump_angle; // on left wall, jump right
	else xv = -jumpsp / tan_jump_angle;
	state_switch("AIR");
}
// Fall off the wall, right
else if (right_held && state_var[1]) {
	state_var[0]++;
	// Only fall off wall if we hold right for a small amount of time
	if (state_var[0] > dir_held_wallride_lag) {
		state_var[0] = 0;
		xv = xv + xa; // on left wall, fall right
		state_switch("AIR"); 
	}
}
// fall off the wall, left
else if (left_held && !state_var[1]) {
	state_var[0]++;
	if (state_var[0] > dir_held_wallride_lag) {
		state_var[0] = 0;
		xv = xv - xa; 
		sprite_index = spr_player_air_one;
		while (place_meeting(x + 1, y, obj_wall)) x = x - 1;
		state_switch("AIR");
	}
}
// we've run out of wall (we're on an invisible wall up top)
else if (instance_nearest(x,y,obj_wall).image_alpha == 0) state_switch("AIR");
// We have really run out of wall
else if (!place_meeting(x - 10, y, obj_wall) && !place_meeting(x + 10, y, obj_wall)) state_switch("AIR"); 

// Get hit (or not). Switch to hit state if hit
player_handle_hit();

// TODO: Maybe firing while wallriding lets us shoot horizontally?

// FOR TESTING ONLY TODO REMOVE
if (y > room_height) y = 0;