/// @description Move camera
if (global.pause == 1) exit;
// We want to move towards follow's (usually the player) y coordinate
if (follow != noone){
	yTo = follow.y + 192;
}

// Camera shake
x += random_range(-shake, shake);
y += random_range(-shake, shake);
shake = shake * shake_decay;

// Moves camera towards target, faster if further away
y += (yTo - y) / 8;
x += (xTo - x) / 8;

// Clamps y value so we do not see above or below level
y = clamp(y, 384, room_height - 384);

// Finally, update the view_matrix with the new information
var view_mat = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, view_mat);