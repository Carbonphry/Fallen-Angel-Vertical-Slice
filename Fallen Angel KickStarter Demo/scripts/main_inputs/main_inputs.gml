gml_pragma("forceinline");
var _x_input = o_input.right_ - o_input.left_; 
var _y_input = o_input.down_ - o_input.up_; 
var _input_direction = point_direction(0, 0, _x_input, _y_input);
var _attack_input = o_input.action_one_pressed_;
var _evade_input = o_input.action_four_; //o_input.action_two_pressed_ 
var _glide_input = o_input.action_two_;
var _parry_input = o_input.action_three_pressed_;
var _jump_input  = o_input.action_four_pressed_;
var _heal_input = o_input.item_down_;
var	_xaxis = gamepad_axis_value(0, gp_axislh);
var	_yaxis = gamepad_axis_value(0, gp_axislv);
var	_stick_direction = point_direction(0,0,_xaxis,_yaxis)
var	r_xaxis = gamepad_axis_value(0, gp_axisrh);
var	r_yaxis = gamepad_axis_value(0, gp_axisrv);
var	r_stick_direction = point_direction(0,0,r_xaxis,r_yaxis);

if _attack_input >= .7 and alarm_get(11) <=0 {
	image_index = 0;
	switch ( power_stance ) {
		
		case false:	
		state_ = player.sword;
		break;
		
		case true:	
		if z == z_ground {
			state_ = player.sword;
			/*var costHeavy = 0;
			if global.player_stamina >= costHeavy {
				global.player_stamina -= costHeavy
				state_ = player.heavy_attack;
				audio_play(a_player_attack_uppercut);
			} else {
				o_hud.alarm[3] = global.one_second*.5;
				o_hud.show_stamina = true;
			}*/
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

if _parry_input and global.player_stamina >= COST_TRIGGER and z == z_ground {
	
	image_index = 0;
	switch power_stance {
		case false:
		global.player_stamina -= COST_PARRY;
		audio_play(a_player_parrythrow);
		state_ = player.parry;
		break;
		
		case true:
		if o_input.alarm[2] <= 0 {
			global.player_stamina -= COST_TRIGGER;
			state_ = player.trigger;
		}
		break;
	}
}
//Right Stick
if 	!(r_xaxis == 0 and r_yaxis == 0) and global.player_stamina >= COST_TRIGGER and z == z_ground {
	switch power_stance {
	
		case false:
		global.player_stamina -= COST_PARRY;
		audio_play(a_player_parrythrow);
		rStick = r_stick_direction; 
		state_ = player.parry;
		break;
		
		case true:
		if o_input.alarm[2] <= 0 {
			rStick = r_stick_direction;
			right_stick = true;
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

if _glide_input and z>z_ground {
	
	
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
	
	
	/*if power_stance {
		player_spd = 6;	
	} else {
		player_spd = 4;
	}*/
}	

