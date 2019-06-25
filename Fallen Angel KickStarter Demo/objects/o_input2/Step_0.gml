/// @description Input
// You can write your code in this editor
///Input

//0 = global.pad[0];
///Put here all the Inputs!
if max ( keyboard_check(vk_right), keyboard_check(vk_left), keyboard_check(vk_up), keyboard_check(vk_down), 
keyboard_check_pressed(vk_right), keyboard_check_pressed(vk_left),  keyboard_check_pressed(vk_up),  
keyboard_check_pressed(vk_down), mouse_check_button_pressed(mb_left), keyboard_check_pressed(vk_space), 
mouse_check_button_pressed(mb_right), keyboard_check_pressed(vk_enter),
keyboard_check_pressed(ord("I")) ) == true then global.gamepad_active = false;


//scr_gamepad_input(global.pad[0]);
left_ = gamepad_axis_value(global.pad[0],gp_axislh) < 0;
right_ = gamepad_axis_value(global.pad[0],gp_axislh) > 0;
down_ = gamepad_axis_value(global.pad[0],gp_axislv) > 0;
up_ = gamepad_axis_value(global.pad[0],gp_axislv) < 0;
	
left_pressed_ = gamepad_axis_value(global.pad[0],gp_axislh) < -0.3 or gamepad_button_check_released(global.pad[0],gp_padl);
right_pressed_ = gamepad_axis_value(global.pad[0],gp_axislh) > 0.3 or gamepad_button_check_released(global.pad[0],gp_padr);
down_pressed_ = gamepad_axis_value(global.pad[0],gp_axislv) > 0.3 or gamepad_button_check_released(global.pad[0],gp_padd); 
up_pressed_ = gamepad_axis_value(global.pad[0],gp_axislv) < -0.3 or gamepad_button_check_released(global.pad[0],gp_padu);

action_one_ = gamepad_button_check(global.pad[0],gp_face3);
action_one_pressed_ = max (gamepad_button_check_pressed(global.pad[0],gp_face3),gamepad_button_check_pressed(global.pad[0],gp_shoulderrb) );
action_two_pressed_ = gamepad_button_check_pressed(global.pad[0],gp_face1);
action_three_pressed_ = max (gamepad_button_check_pressed(global.pad[0],gp_shoulderrb) ,gamepad_button_check_pressed(global.pad[0],gp_shoulderr));
action_three_released_ = gamepad_button_check_released(global.pad[0],gp_shoulderrb);
action_four_ = gamepad_button_check(global.pad[0],gp_face2);
action_four_pressed_ = gamepad_button_check_pressed(global.pad[0],gp_face2);
action_five_ = gamepad_button_check(global.pad[0], gp_shoulderlb);
item_down_ = gamepad_button_check_pressed(global.pad[0], gp_padd);
start = gamepad_button_check_pressed(global.pad[0],gp_start);
pause_pressed_ = gamepad_button_check_pressed(global.pad[0],gp_start);
select_ = gamepad_button_check_pressed(global.pad[0],gp_face1);
respawn_ = gamepad_button_check_pressed(global.pad[0],gp_face1);
dialog_next_ = gamepad_button_check_released(global.pad[0],gp_face1);
if instance_exists(o_hud) {
	if ( o_hud.paused_ == false ) {
		if instance_exists(o_reticle2) { 
			xdir_ = o_reticle2.x; 
			ydir_ = o_reticle2.y; 
		}
	} 
}


/*if max ( gamepad_button_check(0, gp_face1), gamepad_button_check(0, gp_face2), gamepad_button_check(0, gp_face3),gamepad_button_check(0,gp_face4), gamepad_button_check(0,gp_shoulderl), gamepad_button_check(0,gp_shoulderlb), 
gamepad_button_check_pressed(0,gp_shoulderr), gamepad_button_check(0,gp_shoulderrb), gamepad_button_check(0,gp_start),  gamepad_button_check(0,gp_select), gamepad_axis_value(0,gp_axislh), gamepad_axis_value(0,gp_axisrh), gamepad_axis_value(0,gp_axislv), gamepad_axis_value(0,gp_axisrv), gamepad_button_check(0,gp_padd), gamepad_button_check(0,gp_padl), gamepad_button_check(0,gp_padr), gamepad_button_check(0,gp_padu)   ) != 0 
then global.gamepad_active = true;*/


		
		/*xaxis = right_ - left_;
		yaxis = down_ - up_pressed_;

		xaxis = gamepad_axis_value(0, gp_axislh) + (right_ - left_);
		yaxis = gamepad_axis_value(0, gp_axislv) + (down_ - up_);*/


	

/*
dash_key = max(gamepad_button_check_released(device, gp_face1),keyboard_check_pressed(   ));
attack_key = max(gamepad_button_check_pressed(device, gp_face3),keyboard_check_pressed(    ));
hold_press_attack = max(gamepad_button_check(device, gp_face3),keyboard_check(     ));
switch_weapon = max(gamepad_button_check_pressed(device, gp_face4),keyboard_check_pressed(   ));*/

