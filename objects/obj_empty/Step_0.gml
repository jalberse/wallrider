/// @description
xv += xa;
yv += ya;
x += xv;
y += yv;
timer++;
if (yv > 0 || timer > 15) instance_destroy();