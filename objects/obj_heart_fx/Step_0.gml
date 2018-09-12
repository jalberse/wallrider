/// @description
if ((xa < 0 && xv < 0) || (xa > 0 && xv > 0)) {
	image_alpha = image_alpha - .1;
	if (image_alpha < 0) instance_destroy();
}
else {
	xv += xa;
	x += xv;
	y += yv;
	image_alpha = image_alpha - .05;
}