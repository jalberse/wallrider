//@description spawns the specified number of drops at the specified location
//@param x
//@param y
//@param num_small the number of small point value drops
//@param num_large the number of large point value drops
var x_loc = argument0;
var y_loc = argument1;
var num_small = argument2;
var num_large = argument3;

for (var i = 0; i < num_small; i++){
	instance_create_layer(x_loc,y_loc,pickups_layer,obj_drop);
}
for (i = 0; i < num_large; i++) {
	instance_create_layer(x_loc,y_loc,pickups_layer,obj_large_drop);
}