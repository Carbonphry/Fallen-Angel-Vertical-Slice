gml_pragma("forceinline");

left_ = gamepad_axis_value(argument0,gp_axislh) < 0;
right_ = gamepad_axis_value(argument0,gp_axislh) > 0;
down_ = gamepad_axis_value(argument0,gp_axislv) > 0;
up_ = gamepad_axis_value(argument0,gp_axislv) < 0;
	
left_pressed_ = gamepad_axis_value(argument0,gp_axislh) < -0.3 or gamepad_button_check_released(argument0,gp_padl);
right_pressed_ = gamepad_axis_value(argument0,gp_axislh) > 0.3 or gamepad_button_check_released(argument0,gp_padr);
down_pressed_ = gamepad_axis_value(argument0,gp_axislv) > 0.3 or gamepad_button_check_released(argument0,gp_padd); 
up_pressed_ = gamepad_axis_value(argument0,gp_axislv) < -0.3 or gamepad_button_check_released(argument0,gp_padu);

action_one_ = gamepad_button_check(argument0,gp_face3);
action_one_pressed_ =gamepad_button_check_pressed(argument0,gp_face3);
action_two_pressed_ = gamepad_button_check_pressed(argument0,gp_face1);
action_two_ = gamepad_button_check(argument0,gp_face1);
action_two_released_ = gamepad_button_check_released(argument0,gp_face1);
action_three_ = max (gamepad_button_check(argument0,gp_shoulderrb) ,gamepad_button_check(argument0,gp_shoulderr),gamepad_button_check(argument0,gp_face2));
action_three_pressed_ = max (gamepad_button_check_pressed(argument0,gp_shoulderrb) ,gamepad_button_check_pressed(argument0,gp_shoulderr),gamepad_button_check_pressed(argument0,gp_face2));
action_three_released_ = max (gamepad_button_check_released(argument0,gp_shoulderrb) ,gamepad_button_check_released(argument0,gp_shoulderr),gamepad_button_check_released(argument0,gp_face2));
action_four_ = gamepad_button_check(argument0,gp_face2);
action_four_pressed_ = gamepad_button_check_pressed(argument0,gp_face2);
action_four_released_ = gamepad_button_check_released(argument0,gp_face2);
action_five_ = max(gamepad_button_check(argument0, gp_shoulderlb), gamepad_button_check(argument0, gp_shoulderl));
action_five_pressed = max(gamepad_button_check_pressed(argument0, gp_shoulderlb), gamepad_button_check_pressed(argument0, gp_shoulderl));
item_down_ = gamepad_button_check_pressed(argument0, gp_face4);
start = gamepad_button_check_pressed(argument0,gp_start);
pause_pressed_ = gamepad_button_check_pressed(argument0,gp_start);
select_ = gamepad_button_check_pressed(argument0,gp_face1);
respawn_ = gamepad_button_check_pressed(argument0,gp_face1);
dialog_next_ = gamepad_button_check_released(argument0,gp_face1);
if instance_exists(o_hud) {
	if ( o_hud.paused_ == false ) {
		if instance_exists(o_reticle) { 
			/*xdir_ = o_reticle.x; 
			ydir_ = o_reticle.y; 
			
			
			/*var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
			var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
			var length = point_direction(0, 0, xaxis_, yaxis_);
			xdir_ = lengthdir_x(length,xaxis_);
			ydir_ = lengthdir_y(length,yaxis_);*/
			/*xdir_ = o_reticle.direction;
			ydir_ = o_reticle.direction;*/
		}
	} 
}