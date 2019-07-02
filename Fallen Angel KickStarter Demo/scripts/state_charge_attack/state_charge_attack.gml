image_speed = 1;

if sprite_index != s_player_chargeattack_start and sprite_index != s_player_chargeattack_attack {
	
	
	#region
left     = o_input.left_;
right    = o_input.right_;
up       = o_input.up_;
down     = o_input.down_;

if left!=0 or right!=0 or up!=0 or down!=0 {
	sprite_[player.charge_attack, dir.right] = s_player_chargeattack_move;
	sprite_[player.charge_attack, dir.up] = s_player_chargeattack_move;
	sprite_[player.charge_attack, dir.left] = s_player_chargeattack_move;
	sprite_[player.charge_attack, dir.down] = s_player_chargeattack_move;
	image_speed = 0.6;
} else {
	sprite_[player.charge_attack, dir.right] = s_player_chargeattack_idle;
	sprite_[player.charge_attack, dir.up] = s_player_chargeattack_idle;
	sprite_[player.charge_attack, dir.left] = s_player_chargeattack_idle;
	sprite_[player.charge_attack, dir.down] = s_player_chargeattack_idle;
	image_speed = 0.2;
}

if state_ == player.land {
	var jump = false;
} else {
	
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
	
	
}

if place_meeting(x,y,o_stair) {
	if o_input.left_ {
		up = true;
	} else if o_input.right_ {
		down = true;
	}
} else if place_meeting(x,y,o_stair2) {
	if o_input.left_ {
		down = true;
	} else if o_input.right_ {
		up = true;
	}
}

/*if z != z_ground and !gliding {
	
	down = 0;
	up = 0;
}*/

var walk_speed, jump_speed;
var grav_mult

switch power_stance {

	case true:
	if z==z_ground {
		walk_speed = player_spd/4;
	} else {
		walk_speed = player_spd/4;
	}
	break;
	
	case false:
	walk_speed = 1;
	break;

}

jump_speed = 3;
grav_mult = 0;

var diag = .6;
if ( left and up ) or (left and down) or (right and up) or (right and down) {
	diag = .41;//walk_speed = 3.8; ///999999999999999945; //99999999999999999999999
} 


repeat(abs(walk_speed * (right  - left )))
{
    can_move = true;
    highest_z = 0;
    
   
    with (obj_cube_parent)
    {
        if place_meeting(x - (other.right - other.left), y, other)
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
	
	/*with o_enemy 
	{
		if place_meeting(x - (other.right - other.left), y, other)
            {
                
				other.can_move = false;
				
            }
    }*/

	with o_solid 
	{
		if place_meeting(x - (other.right - other.left), y, other)
            {
                
				other.can_move = false;
				
            }
    }
	
	if ((state_ == player.idle or state_ == player.move) and z <= 0) {
		with o_solid_air 
		{
			if place_meeting(x - (other.right - other.left), y, other)
				{
					other.can_move = false;
					break;
				}
	
		}
	}
	
	
    
    if can_move == true
        x += (right*diag - left*diag);
}


repeat(abs(walk_speed * (down  - up )))
{
    can_move = true;
    highest_z = 0;
    
   
	with (obj_cube_parent)
    {
        if place_meeting(x, y - (other.down - other.up), other)
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
	
	/*with o_enemy
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                
					other.can_move = false;
				
                break;
           }
	
	}*/
	
	with o_solid 
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                
					other.can_move = false;
				
                break;
           }
	
	}
	
	
	if ((state_ == player.idle or state_ == player.move) and z <= 0) {
		with o_solid_air 
		{
			if place_meeting(x , y- (other.down - other.up), other)
				{
					other.can_move = false;
					break;
				}
	
		}
	}
	
    if can_move == true
        y += (down*diag - up*diag);
}


if jump and z == z_ground {
    z_speed = jump_speed;
	audio_play(a_player_jump);
	add_screenshake(1.5,30);
	instance_create_layer(x,y,"Effects", o_jumpcloud);
	instance_create_layer(x,y,"Effects", o_black_wings);
	alarm_set(7,global.one_second*.4);
}
/*
if global.auto_jump_ == true and z = z_ground {
    z_speed = 6;
	audio_play(a_player_jump);
	add_screenshake(1.5,30);
	instance_create_layer(x,y,"Effects", o_jumpcloud);
	instance_create_layer(x,y,"Effects", o_black_wings);
	alarm_set(7,global.one_second*.4);
}*/

    
if alarm_get(7) >0 {
	if jump {
		z_speed += 0.2;
	} else {
		alarm[7] = 0;
	}
}
last_z = z;
z += z_speed;
z_speed -= z_speed_gravity;

if o_player.state_ == player.smash
{
	grav_mult = 0.05;
	z_speed_gravity += grav_mult;
} else
{
grav_mult = 0;
z_speed_gravity = .25;
}


if z <= z_ground
{
    z = z_ground;
    z_speed = 0;
	
}

/*if z == z_ground and last_z > z_ground {
	state_ = player.land;
	last_z = z_ground;
}*/
/*if z == z_ground and last_z > 0 {
	state_ = player.land;
}*/


if !place_meeting(x, y, obj_cube_parent)
    z_ground = 0;
	
#endregion
	
	if !o_input.action_one_ {
		sprite_[player.charge_attack, dir.right] = s_player_chargeattack_attack;
		sprite_[player.charge_attack, dir.up] = s_player_chargeattack_attack;
		sprite_[player.charge_attack, dir.left] = s_player_chargeattack_attack;
		sprite_[player.charge_attack, dir.down] = s_player_chargeattack_attack;
	}
}


if sprite_index == s_player_chargeattack_attack {
	
	if !audio_is_playing(a_player_chargeattack_attack) {
			audio_play(a_player_chargeattack_attack);
	}
	if animation_hit_frame(4) {
		create_hitbox(s_charge_hitbox, x, y, 0, 3, [o_enemy, o_grass, o_bush, o_shrine], 3, 0);
	}

}