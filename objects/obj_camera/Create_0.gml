/// @description 

x = room_width / 2; // Camera always in center of screen
y = display_get_gui_height() / 2;

camera = camera_create();
var view_matrix = matrix_build_lookat(x, y, -1, x, y, 1000, 0, 1, 0);
var projection_matrix = matrix_build_projection_ortho(room_width - 16,display_get_gui_height(),-1,1000);
camera_set_view_mat(camera, view_matrix);
camera_set_proj_mat(camera, projection_matrix);

view_camera[0] = camera;

shake = 0; // Magnitude of shake; External objects can set this to create shake
shake_decay = .7; // Decay per frame for screen shake
				   // Closer to 0 is faster

follow = obj_player; // Which object we want to follow, player by default

// Y value to move to, after easing calculations
yTo = y;
xTo = room_width / 2; // We always want to move to center of room