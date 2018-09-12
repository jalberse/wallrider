/// @description
if (global.pause == 1) exit;

if (yv < 0) {
	image_alpha = image_alpha - .2;
	if (image_alpha < 0) instance_destroy();
}
else {
	if (xv > 0) xv += -xa;
	else xv += xa;
	yv += ya;
	x += xv;
	y += yv;
	image_alpha = image_alpha - .02;
}

