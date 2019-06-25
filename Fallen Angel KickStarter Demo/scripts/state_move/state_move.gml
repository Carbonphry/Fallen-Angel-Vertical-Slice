/// @description Move State
gml_pragma("forceinline");
var _x_input = o_input.right_ - o_input.left_; 
var _y_input = o_input.down_ - o_input.up_; 
var _input_direction = point_direction(0, 0, _x_input, _y_input);
var _attack_input = o_input.action_one_pressed_;
var _evade_input = o_input.action_two_released_; 
var _glide_input = o_input.action_two_;
var _throw_input = o_input.action_three_pressed_;
var _heal_input = o_input.item_down_;
var	_xaxis = gamepad_axis_value(0, gp_axislh);
var	_yaxis = gamepad_axis_value(0, gp_axislv);
var	_stick_direction = point_direction(0,0,_xaxis,_yaxis);

//Kill y axis while on the air 
if z != z_ground and !gliding {
	_y_input = 0;
	o_input.down_ = 0;
	o_input.up_ = 0;
}

roll_direction_ = dodge_direction_*45;
if o_input.left_  and o_input.up_
{
    dodge_direction_ = dir_dodge.left_up
}else if o_input.left_ and o_input.down_
{
    dodge_direction_ = dir_dodge.left_down
}else if o_input.left_{
    dodge_direction_ = dir_dodge.left
}

if o_input.right_ and o_input.up_
{
    dodge_direction_ = dir_dodge.right_up
}else if o_input.right_ and o_input.down_
{
    dodge_direction_ = dir_dodge.right_down
}else if o_input.right_ 
{
    dodge_direction_ = dir_dodge.right
}

if o_input.down_ and !o_input.left_ and !o_input.right_
{
    dodge_direction_ = dir_dodge.down
}else if o_input.up_ and !o_input.left_ and !o_input.right_
{
    dodge_direction_ = dir_dodge.up
}

if direction_facing_ > 3
{
direction_facing_ = 0;
}


z_depth_system();


#region Main Anim
///Animation
if gliding {
	sprite_index = sprite_[player.glide, direction_facing_];
} else {

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
			image_speed = 1.25;
			break;
	
			case false:
			sprite_index = sprite_[state_, direction_facing_];
			image_speed = .8;
			break;
		}
	}
}

var _footsteps = choose(a_footsteps, a_footsteps2);

if _x_input == 0 and _y_input == 0 {
		
		audio_stop_sound(_footsteps);
		//image_index = 0;
		image_speed = 0.2;
		apply_friction_to_movement_entity();
		anim_run_stop = true;
		state_ = player.idle;
		
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
			//add_movement_maxspeed(_input_direction, acceleration_, max_speed_);
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

#region Main Keys
//var air = instance_nearest(x,y,o_solid_air);
if _attack_input >= .7 and alarm_get(11) <=0 /*and distance_to_object(air) > 20*/ {
	image_index = 0;
	switch ( power_stance ) {
		
		case false:	
		state_ = player.sword;
		break;
		
		case true:	
		if z == z_ground {
			var costHeavy = 0;
			if global.player_stamina >= costHeavy {
				global.player_stamina -= costHeavy
				state_ = player.heavy_attack;
				audio_play(a_player_attack_uppercut);
			} else {
				o_hud.alarm[3] = global.one_second*.5;
				o_hud.show_stamina = true;
			}
		} else {
			state_ = player.sword;
		}
		break;
	}
}

if _heal_input and o_hud.core_count > 0 and z == z_ground and global.player_health != global.player_max_health {
	image_index = 0;
	state_ = player.heal;
	audio_play(a_player_small_heal);
}

if _throw_input and global.player_stamina >= COST_TRIGGER and z == z_ground {
	
	image_index = 0;
	switch power_stance {
		case false:
		global.player_stamina -= COST_PARRY;
		state_ = player.throw;
		audio_play(a_player_parrythrow);
		break;
		
		case true:
		if o_input.alarm[2] <= 0 {
			global.player_stamina -= COST_TRIGGER;
			state_ = player.trigger;
		}
		break;
	}
}

if _evade_input  {
	
	if z==z_ground {
	
		if global.player_stamina >= COST_DASH {
			switch power_stance {
		
				case false:
				DissolveAmount = .3;
				image_index = 0;
				state_ = player.evade;
				global.player_stamina -= COST_DASH;
				global.player_stamina = max(0, global.player_stamina);
				var _evade_sound = choose(a_player_dash_1, a_player_dash_2, a_player_dash_3);
				audio_play(_evade_sound);
				if !global.coop {
					set_vibration(.2, .2 ,.1);
				}
				break;
			
				case true:
				image_index = 0;
				state_ = player.ram;
				global.player_stamina -= COST_RAM;
				global.player_stamina = max(0, global.player_stamina);
			
				
				break;
			
			}
	
		} else {
			o_hud.alarm[3] = global.one_second*.25;
			o_hud.show_stamina = true;
		}
	}
} 

/*if o_input.action_two_released_ and z>z_ground and !gliding {
	can_glide = true;
} else if z <= z_ground {
	can_glide = false;
}*/



if o_input.action_two_ and z>z_ground {
	
	
	if o_input.alarm[7] ==-1 {
		o_input.alarm[7] = global.one_second*.4;
	}
	
	if o_input.alarm[7] == 1 { 
		o_input.alarm[7] = -1;
		gliding = true;
	} 
} else {
	gliding = false;
	
}

if gliding {
	z_speed = -0.4;
	z_speed_gravity = .2;
	
	
	if power_stance {
		player_spd = 6;	
	} else {
		player_spd = 4;
	}
}	
#endregion


