if (global.pause == 1) exit;

/// @description Handle Input and execute current state
up_held=keyboard_check(vk_up) || keyboard_check(ord("W"));
down_held=keyboard_check(vk_down) || keyboard_check(ord("S"));
left_held=keyboard_check(vk_left) || keyboard_check(ord("A"));
left_released = keyboard_check_released(vk_left) || keyboard_check_released(ord("A"));
right_held=keyboard_check(vk_right) || keyboard_check(ord("D"))
right_released = keyboard_check_released(vk_right) || keyboard_check_released(ord("D"));

run_held=keyboard_check(vk_shift)
jump_pressed=keyboard_check_pressed(vk_space);
jump_held=keyboard_check(vk_space);
jump_released=keyboard_check_released(vk_space);

shoot_pressed = keyboard_check_pressed(ord("M"));
shoot_held = keyboard_check(ord("M"));

time++;

// Run whatever code is in our current state
state_execute();
