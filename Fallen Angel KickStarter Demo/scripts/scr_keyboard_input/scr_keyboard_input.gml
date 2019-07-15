gml_pragma("forceinline");

right_ = keyboard_check(vk_right);
left_  = keyboard_check(vk_left); 
up_    = keyboard_check(vk_up) ;
down_  = keyboard_check(vk_down);
right_pressed_ = keyboard_check_pressed(vk_right);
left_pressed_ = keyboard_check_pressed(vk_left);
up_pressed_ = keyboard_check_pressed(vk_up);
down_pressed_ = keyboard_check_pressed(vk_down);

action_one_ = mouse_check_button(mb_left);
action_one_pressed_ = mouse_check_button_pressed(mb_left);
action_two_pressed_ = keyboard_check_pressed(vk_space); 
action_two_ = keyboard_check(vk_space);
action_two_released_ = keyboard_check_released(vk_space);
action_three_ = keyboard_check(vk_shift);
action_three_pressed_ = keyboard_check_pressed(vk_shift);
action_three_released_ = keyboard_check_released(vk_shift);
action_four_ = mouse_check_button(mb_right);
action_four_pressed_ = mouse_check_button_pressed(mb_right);
action_four_released_ = mouse_check_button_released(mb_right);
action_five_ = keyboard_check_pressed(ord("Q"));
item_down_ = keyboard_check_pressed(ord("E"));

start = keyboard_check_pressed(vk_enter);
xdir_ = mouse_x;
ydir_ = mouse_y;
pause_pressed_ = keyboard_check_pressed(vk_escape);
select_ = max(mouse_check_button_pressed(mb_left),keyboard_check_pressed(vk_space),keyboard_check_pressed(vk_enter));
respawn_ = mouse_check_button_pressed(mb_left);
dialog_next_ = mouse_check_button_released(mb_left);

/*
shift for dash
space for jump
q for stance switch 