/// @description state_machine_init();
/// @function state_machine_init

///Initilize the variables required for the state engine.
state=noone; // Current state
state_next=state; // state_switch alters this variable; we actually swap to it on endframe
state_name="Unknown"; // Current state frame
state_timer=0; // How long have we been in this state?
state_map=ds_map_create(); // key-value pairs of state names and states (scripts)
state_stack=ds_stack_create(); // Lets us remember previous states
state_new=true; // Replacement for "Enter" method
				// Allows us to check for flag and execute only when first entering frame
				// Useful for setting sprite, eg
state_var[0]=0; //Stores variables specific to a state.

// If a variable belongs to the object but are state-dependent
// Note: NOT variables that are only in one state. Rather, these depend on which state we are in
// (unlike, for example, xv or xa or grv which are state-independent)
// Initialize those values here.
// Examples:
//state_is_invincible = false; <---- eg, for a star pick-up in mario
//state_direction = -1; <---- Maybe we change states based on direction! Go buck wild
//state_recoil = 0;