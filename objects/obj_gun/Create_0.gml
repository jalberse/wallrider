/// @description This object has many states, each of which being a gun. There should only ever be one instance of obj_gun.
y = 96;
x = 48;

effects_layer = layer_get_id("effects");
bullets_layer = layer_get_id("bullets");

ammo = 0;
cooldown = 0; // Cooldown for firing. Should be part of weapon system once implemented
shoot_timer = cooldown; // Tracks how long it has been since most recent shot
recoil = 0; // Acceleration imparted by bullet on player
gun_shake = 0; // amt of shake applied to screen
shoot_sprite_hold = 12; // time we hold the shoot sprite animation for player
// Stores appropriate bullet objects for each state
// Key is state name
bullet_types = ds_map_create(); 

// NOTE: Would normally put this as simply a parallel state machine
//       in player object, or make player hold an instance of a gun
//       However due to GML's restrictions we must simply create this object
//       And reference it freely

// Initialize the state machine
// The state machine tracks gun type, which alters data about the gun
state_machine_init();

// Define states
state_create("MELEE", gun_state_melee);
ds_map_add(bullet_types,"MELEE",obj_melee);
state_create("MACHINE_GUN", gun_state_machine_gun);
ds_map_add(bullet_types,"MACHINE_GUN",obj_pea);

// Set default state
state_init("MACHINE_GUN");