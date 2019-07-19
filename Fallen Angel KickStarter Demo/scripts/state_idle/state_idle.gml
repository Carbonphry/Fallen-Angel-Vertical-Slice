/// @description Idle State
var _x_input = o_input.right_ - o_input.left_; 
var _y_input = o_input.down_ - o_input.up_; 
var _input_direction = point_direction(0, 0, _x_input, _y_input);
var	_xaxis = gamepad_axis_value(0, gp_axislh);
var	_yaxis = gamepad_axis_value(0, gp_axislv);
var	_stick_direction = point_direction(0,0,_xaxis,_yaxis)
z_depth_system();

roll_direction_ = direction_facing_*90;

#region Main Anim
///Animation
if z_speed > 0 {
	sprite_index = sprite_[player.jump, direction_facing_];
	image_speed = .6;
} else if z_speed < 0 {
	sprite_index = sprite_[player.fall, direction_facing_];
	image_speed = .6;
} else {
switch (anim_run_stop) {

	case true:
	sprite_index = sprite_[player.run_stop, direction_facing_];
	image_speed = 1.1;
	break;
	
	case false:
	sprite_index = sprite_[state_, direction_facing_];
	image_speed = .2;
	break;
}
}



var _footsteps = choose(a_footsteps, a_footsteps2);

if _x_input == 0 and _y_input == 0 {
		//image_index = 0;
		//image_speed = 0.2;
		apply_friction_to_movement_entity();
		state_ = player.idle;
		audio_stop_sound(_footsteps);
	}
	else
	{
		
		//image_speed = 0.8;
		if _x_input != 0
		{
			image_xscale = _x_input;
		}
		
		state_ = player.move;
		get_direction_facing(_input_direction);
		if can_move {
			//add_movement_maxspeed(_input_direction, acceleration_, max__speed_);
		}
				if (abs(image_index - 0) <= 0.2 || abs(image_index - 4) <= 0.2)
		{ 
			if (footsteps_playing_ = false and footsteps_can_play_ = true) 
			{
				audio_play_sound(_footsteps, 10, false);
				footsteps_playing_ = true;
				footsteps_can_play_ = false;
				alarm[2] = 10;
			}
		}
		else 
		{
			footsteps_playing_ = false;
		}
		
		if (global.gamepad_active)
		{
			roll_direction_ = _stick_direction;
		}
		
		
	}
#endregion

main_inputs();
