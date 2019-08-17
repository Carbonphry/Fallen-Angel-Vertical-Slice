gml_pragma("forceinline");

if ramState == noone then ramState = 0;

switch ramState {

	case 0:
	if !audio_is_playing(a_player_ram_charge) {
		audio_play(a_player_ram_charge);
	}
	image_speed = .8;
	angX = o_reticle.image_angle;
	direction_facing_ = round(angX/90);
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
	sprite_[player.ram, dir.right] = s_player_power_ram_charge_right;
	sprite_[player.ram, dir.up] = s_player_power_ram_charge_up;
	sprite_[player.ram, dir.left] =  s_player_power_ram_charge_right;
	sprite_[player.ram, dir.down] = s_player_power_ram_charge_down;
	sprite_index = sprite_[state_, direction_facing_];
	evade_step = false;
	break;
	
	case 1:
	if angX == 0 {
		left     = 0;
		right    = 1;
		up       = 0;
		down     = 0;	
	} else if angX > 0 and angX < 90  {
		left     = 0;
		right    = 1;
		up       = 1;
		down     = 0;	
	} else if angX == 90 {
		left     = 0;
		right    = 0;
		up       = 1;
		down     = 0;	
	} else if angX > 90 and angX < 180  {
		left     = 1;
		right    = 0;
		up       = 1;
		down     = 0;	
	} else if angX == 180 {
		left     = 1;
		right    = 0;
		up       = 0;
		down     = 0;	
	} else if angX > 180 and angX < 270  {
		left     = 1;
		right    = 0;
		up       = 0;
		down     = 1;	
	} else if angX == 270 {
		left     = 0;
		right    = 0;
		up       = 0;
		down     = 1;	
	} else if angX > 270 and angX < 360  {
		left     = 0;
		right    = 1;
		up       = 0;
		down     = 1;	
	}
	
	sprite_index = sprite_[state_, direction_facing_];
	image_speed = .8;
	sprite_[player.ram, dir.right] = s_player_power_ram_dash_right;
	sprite_[player.ram, dir.up] = s_player_power_ram_dash_up;
	sprite_[player.ram, dir.left] =  s_player_power_ram_dash_right;
	sprite_[player.ram, dir.down] = s_player_power_ram_dash_down;
		if !audio_is_playing(a_player_ram_dash) {
				audio_play(a_player_ram_dash);
		}
	
	/*if animation_hit_frame(0) {
	
	left     = o_input.left_;
	right    = o_input.right_;
	up       = o_input.up_;
	down     = o_input.down_;	
	if (left and right and up and down) == 0 {
		switch direction_facing_ {

			case dir.left:
			left = 1;
			break;

			case dir.right:
			right = 1;
			break;

			case dir.up:
			up = 1;
			break;

			case dir.down:
			down = 1;
			break;
		}
	}
	}*/
	#region New mov

var jump     = o_input.action_four_pressed_;
var walk_speed, jump_speed;
walk_speed = 8;
jump_speed = 3;
var diag = .6;
/*left = 0;
up = 0;
down = 1;
right = 1;*/

if ( left and up ) or (left and down) or (right and up) or (right and down) {
	diag = .41;//walk_speed *=.99999999999999999999; //99999999999999999999999
}

repeat(abs(walk_speed * (right - left)))
{
    can_move = true;
    highest_z = 0;
    
   
    with (obj_cube_parent)
    {
        if place_meeting(x - (other.right*4 - other.left*4), y, other)
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
               
            }
            
        }
    }

	with o_solid 
	{
		if place_meeting(x - (other.right - other.left), y, other)
            {
                other.can_move = false;
				
            }
    }
	
	with o_stair_slow
	{
		if place_meeting(x - (other.right*4 - other.left*4), y, other)
           {
                other.can_move = false;
                
           }
	
	}
	
	with o_enemy
	{
		if place_meeting(x - (other.right - other.left), y, other)
           {
                other.can_move = false;
               
           }
	
	}
	/*with o_solid_air
	{
		if place_meeting(x - (other.right - other.left), y, other) 
            {
                other.can_move = false;
            }
    }
	*/
	if !can_move {
		ramState = 2;
		image_index = 0;
	}
	
    if can_move == true
		//x += (right*diag - left*diag);
        x += (right - left)//*dcos(angX);
}


repeat(abs(walk_speed * (down - up)))
{
    can_move = true
    highest_z = 0;
    
   
	with (obj_cube_parent)
    {
        if place_meeting(x, y - (other.down*4 - other.up*4), other)
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
                
            }
            
        }
    }
	
	with o_solid 
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
               
           }
	
	}
	
	
	with o_stair_slow
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
              
           }
	
	}
	
	with o_enemy
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
           }
	
	}
	if !can_move {
		ramState = 2;
		image_index = 0;
	}
	
    if can_move == true
        //y += (down*diag - up*diag);
		y += (down - up)//*-dsin(angX);
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
	
	
	break;
	
	case 2:
	sprite_index = sprite_[state_, direction_facing_];
	depth -=50;
	image_speed = .9;
	sprite_[player.ram, dir.right] = s_player_power_ram_attack_right;
	sprite_[player.ram, dir.up] = s_player_power_ram_attack_up;
	sprite_[player.ram, dir.left] =  s_player_power_ram_attack_right;
	sprite_[player.ram, dir.down] = s_player_power_ram_attack_down;
		if !audio_is_playing(a_player_ram_attack) {
				audio_play(a_player_ram_attack);
			}
	
	if animation_hit_frame(2) {
		var spr = s_ram_hitbox;
		var ang = 0;
		var life = 20;
		var targets = [o_enemy];
		var dmg = DMG_RAM;
		var knockback = 2;
	
		switch direction_facing_ {
		
		case dir.right:
		var hb = create_hitbox(spr,x+8,y,ang,life,targets,dmg,knockback);
		hb.lift = true;
		break;
		
		case dir.left:
		var hb = create_hitbox(spr,x-8,y,ang,life,targets,dmg,knockback);
		hb.lift = true;
		break;
	
		case dir.up:
		var hb = create_hitbox(spr,x,y,ang,life,targets,dmg,knockback);
		hb.lift = true;
		break;
		
		case dir.down:
		var hb = create_hitbox(spr,x,y+10,ang,life,targets,dmg,knockback);
		hb.lift = true;
		break;
	
		}
	}
	break;
}


//set_movement(roll_direction_, roll__speed_);

//instance_create_layer(o_player.x, o_player.y-o_player.z, "Effects", o_particle_dash);
//instance_create_depth(o_player.x, o_player.y-o_player.z, o_player.depth, o_particle_dash);







