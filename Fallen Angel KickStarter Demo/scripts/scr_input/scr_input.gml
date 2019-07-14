///Input
///Put here all the Inputs!
if max ( keyboard_check(vk_right), keyboard_check(vk_left), keyboard_check(vk_up), keyboard_check(vk_down), 
keyboard_check_pressed(vk_right), keyboard_check_pressed(vk_left),  keyboard_check_pressed(vk_up),  
keyboard_check_pressed(vk_down), mouse_check_button_pressed(mb_left), keyboard_check_pressed(vk_space), 
mouse_check_button_pressed(mb_right), keyboard_check_pressed(vk_enter),
keyboard_check_pressed(ord("I")) ) == true then global.gamepad_active = false;

//argument0 = global.pad[0];

switch (global.coop) {
	
	case false:
	if max ( gamepad_button_check_pressed(argument0, gp_face1), gamepad_button_check_pressed(argument0, gp_face2), gamepad_button_check_pressed(argument0, gp_face3),gamepad_button_check_pressed(argument0,gp_face4), gamepad_button_check(argument0,gp_shoulderl), gamepad_button_check(argument0,gp_shoulderlb), 
	gamepad_button_check_pressed(argument0,gp_shoulderr), gamepad_button_check(argument0,gp_shoulderrb), gamepad_button_check(argument0,gp_start),  gamepad_button_check(argument0,gp_select), gamepad_axis_value(argument0,gp_axislh), gamepad_axis_value(argument0,gp_axisrh), gamepad_axis_value(argument0,gp_axislv), gamepad_axis_value(argument0,gp_axisrv), gamepad_button_check(argument0,gp_padd), gamepad_button_check(argument0,gp_padl), gamepad_button_check(argument0,gp_padr), gamepad_button_check(argument0,gp_padu)   ) != 0 
	then global.gamepad_active = true;
	
	
	switch (global.gamepad_active) {
		
		case false:
		scr_keyboard_input();
		break;
		
		case true:
		scr_gamepad_input(global.pad[0]);
		/*xaxis = right_ - left_;
		yaxis = down_ - up_pressed_;

		xaxis = gamepad_axis_value(argument0, gp_axislh) + (right_ - left_);
		yaxis = gamepad_axis_value(argument0, gp_axislv) + (down_ - up_);*/
		break;
	
	}
	break;
/*
dash_key = max(gamepad_button_check_released(device, gp_face1),keyboard_check_pressed(   ));
attack_key = max(gamepad_button_check_pressed(device, gp_face3),keyboard_check_pressed(    ));
hold_press_attack = max(gamepad_button_check(device, gp_face3),keyboard_check(     ));
switch_weapon = max(gamepad_button_check_pressed(device, gp_face4),keyboard_check_pressed(   ));*/
	case true:
	scr_keyboard_input();
	break;

}





/*
right_ = keyboard_check(vk_right);
left_ = keyboard_check(vk_left);
up_ = keyboard_check(vk_up);
down_ = keyboard_check(vk_down);
action_one_pressed_ = (mouse_check_button_pressed(mb_left));
action_two_pressed_ = (keyboard_check_pressed(vk_space));
xdir_ = mouse_x;
ydir_ = mouse_y;

if (gamepad_is_connected(0)) {
	gamepad_set_axis_deadzone(0, 0.3);
	left_ = gamepad_axis_value(0,gp_axislh) < 0;
	right_ = gamepad_axis_value(0,gp_axislh) > 0;
	down_ = gamepad_axis_value(0,gp_axislv) > 0;
	up_ = gamepad_axis_value(0,gp_axislv) < 0;
	action_one_pressed_ = gamepad_button_check_pressed(0,gp_shoulderrb);
	action_two_pressed_ = gamepad_button_check_pressed(0,gp_face2);
	xdir_ = o_reticle.x;
	ydir_ = o_reticle.y;
} */
/////////////////////////////////////////////////////////////////


