/// @description Idle State

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
	image_speed = 1.25;
	break;
	
	case false:
	sprite_index = sprite_[state_, direction_facing_];
	image_speed = .2;
	break;
}
}

//image_speed = 0.2;
var _x_input = o_input2.right_ - o_input2.left_; 
var _y_input = o_input2.down_ - o_input2.up_; 
var _input_direction = point_direction(0, 0, _x_input, _y_input);
var _attack_input = o_input2.action_one_pressed_;
var _evade_input = o_input2.action_two_pressed_;
var _parry_input = o_input2.action_three_pressed_;
var _heal_input = o_input2.item_down_;
var	_xaxis = gamepad_axis_value(0, gp_axislh);
var	_yaxis = gamepad_axis_value(0, gp_axislv);
var	_stick_direction = point_direction(0,0,_xaxis,_yaxis)

roll_direction_ = direction_facing_*90;

var _footsteps = choose(a_footsteps, a_footsteps2);

z_depth_system2();

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

if _attack_input >= .7 
{
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

if _heal_input and o_hud.core_count > 0 and z == z_ground and global.player_health != global.player_max_health {
	image_index = 0;
	state_ = player.heal;
	audio_play(a_player_small_heal);
}

if _evade_input == true and global.player_stamina >= evade_stamina_cost_
{
	image_index = 0;
	state_ = player.evade;
	global.player_stamina -= evade_stamina_cost_;
	global.player_stamina = max(0, global.player_stamina);
	var _evade_sound = choose(a_player_dash_1, a_player_dash_2, a_player_dash_3);
	audio_play(_evade_sound);
	set_vibration(.2, .2 ,.1);
}

/*if _parry_input == true 
{
	if sigil_equipped_ == true and global.player_stamina >= o_sigil_item.cost_
	{
		image_index = 0;
		state_ = player.parry;
		global.player_stamina -= o_sigil_item.cost_;
		global.player_stamina = max(0, global.player_stamina);
		//audio_play(a_throw);
		audio_play_sound(a_throw,10,false);
	}
}*/

if instance_exists(o_tp_projectile) and o_tp_projectile.can_tp_== true
{
	if _parry_input == true
	{
		audio_play_sound(a_teleport, 8, false);
		create_animation_effect(s_tp_poof, x, y, 1.4, true);
		x = o_tp_projectile.x;
		y = o_tp_projectile.y+10;
		o_tp_projectile.destroy_ = true;
		state_ = starting_state_
		throwing_ = false;
		create_animation_effect(s_tp_poof, x, y, 0.8, true);
	}
}

if instance_exists(o_tp_mark)
{
	marked_ = true;
	if _parry_input == true and marked_ = true
	{
		var _angle = 0;
		var _life = 3;
		var _damage = 1;
		var _knockback = 4;
		
		audio_play_sound(a_teleport, 8, false);
		create_animation_effect(s_tp_poof, x, y, 1.4, true);
		x = o_tp_mark.x;
		y = o_tp_mark.y+40;
		o_tp_mark.destroy_ = true;
		state_ = starting_state_
		throwing_ = false;
		create_animation_effect(s_tp_poof, x, y, 0.8, true);
		create_hitbox(s_tp_hitbox, o_player.x, o_player.y, _angle, _life, [o_enemy], _damage, _knockback);
		marked_ = false;
	}
}