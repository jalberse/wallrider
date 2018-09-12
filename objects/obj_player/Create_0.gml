/// @description Initialize
instance_create_layer(0,0,"player",obj_gun);
display_set_gui_size(1024,768);
// Properties
sprite_index = spr_player_air_one;
image_xscale = 1;
// Kinematics
xa = .4; // Acceleration when player inputs left/right (absolute value)
xv = 0; // x velocity
xv_max = 7.5; 

grv = .25; // Gravity; constant y acceleration
down_grv_factor = 1.5; // Gravity increase when heading down - more snappy
yv = 0; // y velocity
ya = .03; // y acceleration imparted by user up/down, while wallriding

jumpsp = 8; // The initial vertical speed of a jump
tan_jump_angle = 1.5 // Tangent of jump vector; determines angle of jump
fr = .2; // Acceleration as a result of force of friction on wallrides; 
		 // apply opposite direction of motion

// Properties and stats
score = 0;
combo = 0;
highest_combo = 0;
tracer_combo_start = 600; // score during combo to start showing tracer
time = 0; // frames passed, game time
hp_max = 15;
hp = hp_max;
iframes = 45;
invincible = false;
death_frames = 90; // how long we are in dead state before game over

shoot_sprite_hold = 12; // How long we hold the fire animation for

// Controls
left_held = false;
right_held = false;
dir_held_wallride_lag = 6; // Lag time for user to input right/left AAND jump before falling off wall
up_held = false;
down_held = false;

jump_pressed = false;
jump_held = false;
jump_released = false;

shoot_pressed = false;
shoot_held = false;

enemies_layer = layer_get_id("enemies");
effects_layer = layer_get_id("effects");

// Initialize the state machine
state_machine_init();

// Define states
state_create("AIR",player_state_air);
state_create("WALLRIDE",player_state_wallride);
state_create("HIT",player_state_hit);
state_create("DEAD",player_state_dead);

// Set default (beginning) state
state_init("AIR");