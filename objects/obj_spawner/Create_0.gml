/// @description

// The spawner runs on a state machine
// Each state produces a specific pattern of enemies
// Create the levels by utilizing our stack of states

// Initialize the state machine
state_machine_init();
switching = false; // This is an extra flag for this state machine
				   // Necessary for update method
				   // Because we allow repeated states, but still need to reset them
// Define our states, that is, define what each wave will look like
state_create("INACTIVE", spawner_state_inactive);
state_create("LINE", spawner_state_line);
state_create("BLOCK", spawner_state_block);
state_create("HARMONIC_LINE", spawner_state_harmonic_line);
state_create("HARMONIC_BLOCK", spawner_state_harmonic_block);

// PROPERTIES
split_time = 200; // The amount of time each state executes for
				  // 300frames = 5 seconds
				  // Note: default value. Each state can chooses its own duration
current_wave = 0; // Tracks which wave we are on

enemies_layer = layer_get_id("enemies");

WAVES_MAX = 4;

// TODO: sin/cos AI components/spawner states

// DEFINE ORDER OF WAVES
// TODO: Make a random assigner
spawner_state_batch_gen(); // generates first states
waves[0] = "HARMONIC_BLOCK"; // Our initial state
state_init("HARMONIC_BLOCK");

