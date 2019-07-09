//Attack Speed

#region Animation Swaps

switch power_stance  {

	case false:
	if z==z_ground {
		sprite_[player.sword, dir.right] = s_player_attack_right_1;
		sprite_[player.sword, dir.up] = s_player_attack_up_1;
		sprite_[player.sword, dir.left] = s_player_attack_right_1;
		sprite_[player.sword, dir.down] = s_player_attack_down_1;

		sprite_[player.sword2, dir.right] = s_player_attack_right_2;
		sprite_[player.sword2, dir.up] = s_player_attack_up_2;
		sprite_[player.sword2, dir.left] = s_player_attack_right_2;
		sprite_[player.sword2, dir.down] = s_player_attack_down_2;

		sprite_[player.sword3, dir.right] = s_player_attack_right_3;
		sprite_[player.sword3, dir.up] = s_player_attack_up_3;
		sprite_[player.sword3, dir.left] = s_player_attack_right_3;
		sprite_[player.sword3, dir.down] = s_player_attack_down_3;
	} else if z>z_ground {
		sprite_[player.sword, dir.right] = s_player_attack_air_1;
		sprite_[player.sword, dir.up] = s_player_attack_air_1;
		sprite_[player.sword, dir.left] = s_player_attack_air_1;
		sprite_[player.sword, dir.down] = s_player_attack_air_1;

		sprite_[player.sword2, dir.right] = s_player_attack_air_2;
		sprite_[player.sword2, dir.up] = s_player_attack_air_2;
		sprite_[player.sword2, dir.left] = s_player_attack_air_2;
		sprite_[player.sword2, dir.down] = s_player_attack_air_2;

		sprite_[player.sword3, dir.right] = s_player_attack_air_3;
		sprite_[player.sword3, dir.up] = s_player_attack_air_3;
		sprite_[player.sword3, dir.left] = s_player_attack_air_3;
		sprite_[player.sword3, dir.down] = s_player_attack_air_3;
	}
	break;
	
	case true:
	if z==z_ground {
		sprite_[player.sword, dir.right] = s_player_power_attack_1;
		sprite_[player.sword, dir.up] = s_player_power_attack_1;
		sprite_[player.sword, dir.left] = s_player_power_attack_1;
		sprite_[player.sword, dir.down] = s_player_power_attack_1;

		sprite_[player.sword2, dir.right] = s_player_power_attack_2;
		sprite_[player.sword2, dir.up] = s_player_power_attack_2;
		sprite_[player.sword2, dir.left] = s_player_power_attack_2;
		sprite_[player.sword2, dir.down] = s_player_power_attack_2;
	} else if z>z_ground {
		sprite_[player.sword, dir.right] = s_player_power_attack_air_1;
		sprite_[player.sword, dir.up] = s_player_power_attack_air_1;
		sprite_[player.sword, dir.left] = s_player_power_attack_air_1;
		sprite_[player.sword, dir.down] = s_player_power_attack_air_1;

		sprite_[player.sword2, dir.right] = s_player_power_attack_air_2;
		sprite_[player.sword2, dir.up] = s_player_power_attack_air_2;
		sprite_[player.sword2, dir.left] = s_player_power_attack_air_2;
		sprite_[player.sword2, dir.down] = s_player_power_attack_air_2;

		sprite_[player.sword3, dir.right] = s_player_power_attack_air_3;
		sprite_[player.sword3, dir.up] = s_player_power_attack_air_3;
		sprite_[player.sword3, dir.left] = s_player_power_attack_air_3;
		sprite_[player.sword3, dir.down] = s_player_power_attack_air_3;
	}
	break;

}


#endregion

switch state_ {

	case player.sword:
	var _attack_sound = choose(a_player_attack_1, a_player_attack_2, a_player_attack_3);
	image_speed = 1.1;
	break;
	
	case player.sword2:
	var _attack_sound = choose(a_player_attack_1, a_player_attack_2, a_player_attack_3);
	image_speed = 1.25;
	break;
	
	case player.sword3:
	var _attack_sound = a_player_attack_extradamage;
	image_speed = 1.35;
	break;

}


move_movement_entity(true);
apply_friction_to_movement_entity();
var _attack_input = o_input.action_one_pressed_;
var _evade_input = o_input.action_three_;
var _parry_input = 0//o_input.action_three_pressed_;
var	r_xaxis = gamepad_axis_value(0, gp_axisrh);
var	r_yaxis = gamepad_axis_value(0, gp_axisrv);
var	r_stick_direction = point_direction(0,0,r_xaxis,r_yaxis);


if o_input.action_two_ {
	if o_input.alarm[8] <=0 {
			o_input.alarm[8] = global.one_second*.15;
	}
} else {
		o_input.alarm[8] = global.one_second*.15;
}
	
if o_input.alarm[8] == 1 { 
	o_input.alarm[8] = -1;
	var _jump_input = o_input.action_two_;
} else { 
	if z<=z_ground then var _jump_input = false;
}
	

if z>z_ground  {
	var _jump_input = o_input.action_two_;
}

if attacking_ == false {
	attacking_ = true;
	//direction_facing_ = round(o_reticle.direction/90);
	switch global.gamepad_active {
		
		case false:
		direction_facing_ = round(point_direction(x, y, o_input.xdir_, o_input.ydir_)/90);
		break;
		
		case true:
		direction_facing_ = round(o_reticle.direction/90);
		break;
			
	}
}

if direction_facing_ > 3
{
	direction_facing_ = 0;
}

if direction_facing_ == 0 
{
	image_xscale = 1;
}
if direction_facing_ == 2 
{
	image_xscale = -1;
}



if animation_hit_frame(1)
{
	
	switch global.gamepad_active {
		
		case false:
		var _angle = point_direction(x, y, o_input.xdir_, o_input.ydir_);
		break;
		
		case true:
		var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
		var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
		var _angle = o_reticle.direction;//point_direction(0, 0, xaxis_, yaxis_);
		break;
			
	}
	
	var _life = 3;
	if state_ != player.sword3 {
		var _damage = DMG_SWING;
		var _knockback = 1;
	} else {
		var _damage = DMG_THIRD_SWING;
		var _knockback = 1;
	}
	
	if z > z_ground {
		var _hitbox = create_hitbox(s_sword_hitbox_air, x, y-4, _angle, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
		with _hitbox {
			if !place_meeting(x,y,o_enemy)  {
				with other {
					var lenx = lengthdir_x(AIR_SWING_KNOCKFORWARD,o_reticle.image_angle);
					var leny = lengthdir_y(AIR_SWING_KNOCKFORWARD,o_reticle.image_angle);
					/*if !place_meeting(x+lenx,y-z,o_solid) and !place_meeting(x+lenx,y-z,o_enemy) {
						x += lenx;
					}
					/*if !place_meeting(x,y+leny-z,o_solid) and !place_meeting(x,y+leny-z,o_enemy) {
						y += leny;
					}*/
				}
			}
		}
	} else {
		
		switch power_stance {
		
			case false:
			var _hitbox = create_hitbox(s_sword_hitbox, x, y-4, _angle, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
			break;
			
			case true:
			var _hitbox = create_hitbox(s_power_attack_hitbox, x, y-4, _angle, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
			break;
		
		}
		
		if state_ == player.sword3 {
			_hitbox.stun = true;
		}
	}
	
	with _hitbox {
		if (place_meeting(x,y,o_solid) or place_meeting(x,y,o_lancer)) and !place_meeting(x,y,o_cherub) and !place_meeting(x,y,o_flameangel) and !place_meeting(x,y,o_missile_angel) and !place_meeting(x,y,o_tankangel) and !place_meeting(x,y,o_abdiel) and other.z == other.z_ground     
		{
			if place_meeting(x,y,o_lancer) {
				var lan = instance_nearest(x,y,o_lancer);
				if lan.state_ != lancer.stun and !stun and !other.power_stance {
					with other {
						image_index = 0;
						state_ = player.failHit;
						audio_play(a_player_failedhit);
					}
				}
			} else if !other.power_stance {
				with other {
				image_index = 0;
				state_ = player.failHit;
				audio_play(a_player_failedhit);
				}
			}
			
		} else if place_meeting(x,y,o_enemy) {
				with other { 
					switch state_ {
				
						case player.sword:
						o_pride_meter.ego_add += PTS_ATTACK_1;	
						break;
					
						case player.sword2:
						o_pride_meter.ego_add += PTS_ATTACK_2;	
						break;
					
						case player.sword3:
						o_pride_meter.ego_add += PTS_ATTACK_3;	
						break;
				
					}
				}
			}
		}
	
	if state_ != player.failHit {
	audio_play(_attack_sound);
	} else {
		audio_play(a_player_attack_projectile);
		
	}
		
	//set_movement(_angle, 2);
	
	/*spd*dcos(_angle);
	spd*-dsin(_angle);*/
	if state_ == player.sword2 {
		combo_ = false;
	}
	
	if z == z_ground {
	#region Set Mov

//scr_jump_input();
if o_input.action_two_ {
	if o_input.alarm[8] <=0 {
			o_input.alarm[8] = global.one_second*.15;
	}
} else {
		o_input.alarm[8] = global.one_second*.15;
}
	
if o_input.alarm[8] == 1 { 
	o_input.alarm[8] = -1;
	var jump = o_input.action_two_;
} else { 
	if z<=z_ground then var jump = false;
}
	
if z>z_ground  {
	var jump = o_input.action_two_;
}
var walk_speed, jump_speed;
if power_stance {
	walk_speed = 16;
} else {
	walk_speed = 8;
}
jump_speed = 3;
left = 0;
up = 0;
down = 1;
right = 1;


if ( left and up ) or (left and down) or (right and up) or (right and down) {
	walk_speed *=.99999999999999999999; //99999999999999999999999
}

repeat(abs(walk_speed * (right - left)))
{
    can_move = true;
    highest_z = 0;
    
   
    with (obj_cube_parent)
    {
        if place_meeting(x - (other.right - other.left)*dcos(_angle), y, other)
            {
                if other.z >= height
                {
                    other.can_move = true;
                    if height > other.highest_z
                    {
                        other.z_ground = height;
                        other.highest_z = height;   
                    }
            }
            else
            {
                other.can_move = false;
                break;
            }
            
        }
    }

	with o_solid 
	{
		if place_meeting(x - (other.right - other.left)*dcos(_angle), y, other)
            {
                other.can_move = false;
            }
    }
	
	with o_solid_air 
	{
		if place_meeting(x - (other.right - other.left)*dcos(_angle), y, other)
            {
                other.can_move = false;
            }
    }
	
	with o_enemy
	{
		if place_meeting(x - (other.right - other.left)*dcos(_angle), y, other)
            {
                other.can_move = false;
            }
    }
    
    if can_move == true
        x += (right - left)*dcos(_angle);
	//spd*-dsin(_angle);
}


repeat(abs(walk_speed * (down - up)))
{
    can_move = true;
    highest_z = 0;
    
   
	with (obj_cube_parent)
    {
        if place_meeting(x, y - (other.down - other.up)*-dsin(_angle), other)
            {
                if other.z >= height
                {
                    other.can_move = true;
                    if height > other.highest_z
                    {
                        other.z_ground = height;
                        other.highest_z = height;   
                    }
            }
            else
            {
                other.can_move = false;
                break;
            }
            
        }
    }
	
	with o_solid 
	{
		if place_meeting(x , y- (other.down - other.up)*-dsin(_angle), other)
           {
                other.can_move = false;
                break;
           }
	
	}
	
	with o_solid_air 
	{
		if place_meeting(x , y- (other.down - other.up)*-dsin(_angle), other)
           {
                other.can_move = false;
                break;
           }
	
	}
	
	with o_enemy 
	{
		if place_meeting(x , y- (other.down - other.up)*-dsin(_angle), other)
           {
                other.can_move = false;
                break;
           }
	
	}
	
    if can_move == true
        y += (down - up)*-dsin(_angle);
}


if jump
and z = z_ground
    z_speed = jump_speed;
    

z += z_speed;
z_speed -= z_speed_gravity;


if z <= z_ground
{
    z = z_ground;
    z_speed = 0;
}


if !place_meeting(x, y, obj_cube_parent)
    z_ground = 0;
	
#endregion
	
	}
	
	switch direction_facing_
	{
		case dir.up: _hitbox.y -= 6; break;
		default: _hitbox.y -= 6; break;
	}
	
	
}


if animation_hit_frame(2)
{
	alarm[4] = 10;
	anim_cancel = true;
}

if _jump_input and !combo_ and (alarm_get(7) > global.one_second*.3 or ( alarm_get(7) ==-1 and z== 0)) {
	attacking_ = false;
	state_ = starting_state_;
	jump_slash = true;
}

if animation_hit_frame(3)
{
	alarm[1] = 10;
	combo_ = true;	
	
}


if _evade_input >= .7 and global.player_stamina >= evade_stamina_cost_ and anim_cancel {
	attacking_ = false;
	image_index = 0;
	state_ = player.evade;
	global.player_stamina -= evade_stamina_cost_;
	global.player_stamina = max(0, global.player_stamina);
	var _evade_sound = choose(a_player_dash_1, a_player_dash_2, a_player_dash_3);
	audio_play(_evade_sound);
}

if _parry_input and global.player_stamina >= COST_TRIGGER and z == z_ground and anim_cancel {
	attacking_ = false;
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
if 	!(r_xaxis == 0 and r_yaxis == 0) and global.player_stamina >= COST_TRIGGER and z == z_ground and anim_cancel {
	attacking_ = false;
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

if state_ != player.sword3 {

	if (_attack_input >= .6 and combo_)	
	{
		attacking_ = false;
		image_index = 0;

		switch global.gamepad_active {
		
			case false:
			var _angle = point_direction(x, y, o_input.xdir_, o_input.ydir_);
			break;
		
			case true:
			var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
			var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
			var _angle = o_reticle.direction;//point_direction(0, 0, xaxis_, yaxis_);
			break;
			
		}
		
		get_direction_facing(_angle);
		switch state_ {
		
			case player.sword:
			state_ = player.sword2;
			break;
			
			case player.sword2:
			if power_stance and z==z_ground {
				state_ = player.heavy_attack;
			} else {
				state_ = player.sword3;
			}
			break;
		}
		
	}
}

if animation_hit_frame(image_number - 1)
{
		state_ = starting_state_
		attacking_ = false;
		if z > z_ground {
			alarm_set(11,global.one_second*.5);
		}
}