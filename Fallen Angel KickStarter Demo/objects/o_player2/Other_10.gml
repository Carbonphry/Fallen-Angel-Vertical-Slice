/// @description Move State

//Animation
/*if sprite_index == s_player_run_up_start or sprite_index == s_player_run_right_start or sprite_index == s_player_run_down_start {
	anim_run_start = true;
} else {
	anim_run_start = false;
}*/

//move_movement_entity(false);

if z_speed > 0 {
	sprite_index = sprite_[player.jump, direction_facing_];
	image_speed = .6;
} else if z_speed < 0 {
	sprite_index = sprite_[player.fall, direction_facing_];
	image_speed = .6;
} else {
	switch (anim_run_start) {

	case true:
	sprite_index = sprite_[player.run_start, direction_facing_];
	break;
	
	case false:
	sprite_index = sprite_[state_, direction_facing_];
	break;
	}
}

image_speed = 0;
var _x_input = o_input2.right_ - o_input2.left_; 
var _y_input = o_input2.down_ - o_input2.up_; 
var _input_direction = point_direction(0, 0, _x_input, _y_input);
var _attack_input = o_input2.action_one_pressed_;
var _evade_input = o_input2.action_two_pressed_;
var _throw_input = o_input2.action_three_pressed_;
var _jump_input  = o_input2.action_four_pressed_;
var _heal_input = o_input2.item_down_;
var	_xaxis = gamepad_axis_value(0, gp_axislh);
var	_yaxis = gamepad_axis_value(0, gp_axislv);
var	_stick_direction = point_direction(0,0,_xaxis,_yaxis)

roll_direction_ = dodge_direction_*45;
if o_input2.left_  and o_input2.up_
{
    dodge_direction_ = dir_dodge.left_up
}else if o_input2.left_ and o_input2.down_
{
    dodge_direction_ = dir_dodge.left_down
}else if o_input2.left_{
    dodge_direction_ = dir_dodge.left
}

if o_input2.right_ and o_input2.up_
{
    dodge_direction_ = dir_dodge.right_up
}else if o_input2.right_ and o_input2.down_
{
    dodge_direction_ = dir_dodge.right_down
}else if o_input2.right_ 
{
    dodge_direction_ = dir_dodge.right
}

if o_input2.down_ and !o_input2.left_ and !o_input2.right_
{
    dodge_direction_ = dir_dodge.down
}else if o_input2.up_ and !o_input2.left_ and !o_input2.right_
{
    dodge_direction_ = dir_dodge.up
}

if direction_facing_ > 3
{
direction_facing_ = 0;
}


z_depth_system2();


var _footsteps = choose(a_footsteps, a_footsteps2, a_footsteps3);

if _x_input == 0 and _y_input == 0
	{
		//image_index = 0;
		image_speed = 0.2;
		apply_friction_to_movement_entity();
		anim_run_stop = true;
		state_ = player.idle;
		
	}
	else
	{
		image_speed = 0.8;
		if _x_input != 0
		{
			image_xscale = _x_input;
		}
		
		state_ = player.move;
	
		get_direction_facing(_input_direction);
		if can_move {
			//add_movement_maxspeed(_input_direction, acceleration_, max_speed_);
		}
		
		if (abs(image_index - 0) <= 0.2 || abs(image_index - 4) <= 0.2)
		{ 
			if (footsteps_playing_ = false and footsteps_can_play_ = true) 
			{
				audio_play_priority(_footsteps);
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

if _attack_input >= .7 {
	image_index = 0;
	switch ( power_stance ) {
		
		case false:	
		state_ = player.sword;
		break;
		
		case true:	
		if z == z_ground {
		var costHeavy = 1.5;
		if global.player_stamina >= costHeavy {
			global.player_stamina -= costHeavy
			state_ = player.heavy_attack;
			audio_play(a_player_attack_uppercut);
		}  else {
				o_hud.alarm[3] = global.one_second*.5;
				o_hud.show_stamina = true;
			}
		}
		break;
	}
}

if _evade_input >= .7 and global.player_stamina >= evade_stamina_cost_
{
	DissolveAmount = .3;
	image_index = 0;
	state_ = player.evade;
	global.player_stamina -= evade_stamina_cost_;
	global.player_stamina = max(0, global.player_stamina);
	var _evade_sound = choose(a_player_dash_1, a_player_dash_2, a_player_dash_3);
	audio_play(_evade_sound);
	if !global.coop {
		set_vibration(.2, .2 ,.1);
	}
}

/*if _jump_input and room == r_garden {
	audio_play(a_player_dash_3);
	image_index = 0;
	state_ = player.jump;
	global.player_stamina -= evade_stamina_cost_;
	global.player_stamina = max(0, global.player_stamina);
	//audio_play_sound(a_throw, 8, false);
	
}*/
if _heal_input and o_hud.core_count > 0 and z == z_ground and global.player_health != global.player_max_health {
	image_index = 0;
	state_ = player.heal;
	audio_play(a_player_small_heal);
}

/*if _throw_input
{
	if sigil_equipped_ == true and global.player_stamina >= o_sigil_item.cost_
	{
		image_index = 0;
		state_ = player.throw;
		global.player_stamina -= o_sigil_item.cost_;
		global.player_stamina = max(0, global.player_stamina);
		audio_play_sound(a_throw, 8, false);
	}
}*/







/*if place_meeting()
o_player.collision_object_ = o_solid_l2;
o_player.current_layer_ = LAYER2;*/