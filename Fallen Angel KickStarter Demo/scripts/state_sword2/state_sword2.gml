/// @description Sword2 State
image_speed = 1.12;
move_movement_entity(true);
apply_friction_to_movement_entity();
var _attack_input = o_input.action_one_pressed_;
var _evade_input = o_input.action_two_pressed_;
var _parry_input = o_input.action_three_pressed_;
var	r_xaxis = gamepad_axis_value(0, gp_axisrh);
var	r_yaxis = gamepad_axis_value(0, gp_axisrv);
var	r_stick_direction = point_direction(0,0,r_xaxis,r_yaxis);

if attacking_ == false {
	attacking_ = true;
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

var _attack_sound = choose(a_player_attack_1, a_player_attack_2, a_player_attack_3);

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
	var _damage = DMG_SWING;
	var _knockback = 4;
	if z > z_ground {
		var _hitbox = create_hitbox(s_sword_hitbox_air, x, y-4, _angle, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
		with _hitbox {
			if !place_meeting(x,y,o_enemy)  {
				/*with other {
					x += lengthdir_x(AIR_SWING_KNOCKFORWARD,o_reticle.image_angle);
					y += lengthdir_y(AIR_SWING_KNOCKFORWARD,o_reticle.image_angle);
				}*/
			}
		}
	} else {
		var _hitbox = create_hitbox(s_sword_hitbox, x, y-4, _angle, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
	}
	with _hitbox {
		if (place_meeting(x,y,o_solid) or place_meeting(x,y,o_lancer)) and !place_meeting(x,y,o_cherub) and !place_meeting(x,y,o_flameangel) and !place_meeting(x,y,o_missile_angel) and !place_meeting(x,y,o_tankangel) and !place_meeting(x,y,o_abdiel) and other.z == other.z_ground     
		{
			if place_meeting(x,y,o_lancer) {
				var lan = instance_nearest(x,y,o_lancer);
				if lan.state_ != lancer.stun  {
					with other {
						image_index = 0;
						state_ = player.failHit;
						audio_play(a_player_failedhit);
					}
				}
			} else {
				with other {
				image_index = 0;
				state_ = player.failHit;
				audio_play(a_player_failedhit);
				}
			}
			
		} else if place_meeting(x,y,o_enemy) {
				o_pride_meter.ego_add += PTS_ATTACK_2;	
			}
	}
	if state_ != player.failHit {
	audio_play(_attack_sound);
	} else {
		audio_play(a_player_attack_projectile);
		
	}
	combo_ = false;//Reset combo	
	
	//set_movement(_angle, 2);
	if z == z_ground {
		#region Set Mov
	
var jump     = o_input.action_four_pressed_;
var walk_speed, jump_speed;
walk_speed = 8;
jump_speed = 3;
//left = 1;
//up = 1;
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
z_speed -= z__speed_gravity;


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
	state_ = starting_state_;
	jump_slash = true;
}

if animation_hit_frame(3)
{
	alarm[1] = 10;
	combo_ = true;	
}

if _evade_input >= .7 and global.player_stamina >= evade_stamina_cost_ and anim_cancel {
	image_index = 0;
	state_ = player.evade;
	global.player_stamina -= evade_stamina_cost_;
	global.player_stamina = max(0, global.player_stamina);
	var _evade_sound = choose(a_player_dash_1, a_player_dash_2, a_player_dash_3);
	audio_play(_evade_sound);
}

if _parry_input and global.player_stamina >= COST_TRIGGER and z == z_ground and anim_cancel {
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




if (_attack_input >= .6 and combo_)	
{
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
/*direction_facing_ = round(point_direction(x, y, o_input.xdir_, o_input.ydir_)/90);
	if direction_facing_ > 3
	{
	direction_facing_ = 0;
	}*/
state_ = player.sword3;
}

if animation_hit_frame(image_number - 1)
{
		state_ = starting_state_
		attacking_ = false;
		if z > z_ground {
			alarm_set(11,global.one_second*.5);
		}
}
