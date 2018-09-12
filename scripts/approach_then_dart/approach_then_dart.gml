// Kinematics; approach underneath player then shoot up
if (y < (obj_player.y + 300) && abs(obj_player.x - x) < 32) {
	xv = 0;
	yv = -yv_max;
	image_angle = 0;
}
else {
	xv = min((obj_player.x - x) / 128, xv_max);
	yv = -yv_max / 3;
	image_angle = point_direction(x,y,obj_player.x,obj_player.y) - 90;
}
x += xv;
y += yv;
x = clamp(x, 128, room_width - 128);