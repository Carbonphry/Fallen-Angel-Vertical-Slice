/// @description Heavy Attack
// You can write your code in this editor
var _attack_input = o_input.action_one_pressed_;
var _evade_input = o_input.action_two_pressed_;

image_speed = 1;
move_movement_entity(true);
apply_friction_to_movement_entity();

if image_index <= 3 {
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

if animation_hit_frame(4)
{
instance_create_layer(o_player.x, o_player.y-o_player.z, "Effects", o_particle_smash);

switch global.gamepad_active {
		
	case false:
	var _angle = point_direction(x, y, o_input.xdir_, o_input.ydir_);
	break;
		
		case true:
		var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
		var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
		var _angle = o_reticle.direction;
		break;
			
}
//set_movement(_angle, 4);
//set_move_n(_angle, 24);
add_screenshake(10,15);
#region Set Mov

var jump     = true;//o_input.action_four_pressed_;
var walk_speed, jump_speed;
walk_speed = 24;
jump_speed = 6;
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

if animation_hit_frame(5)
{

switch global.gamepad_active {
		
		case false:
		var _angle = point_direction(x, y, o_input.xdir_, o_input.ydir_);
		break;
		
		case true:
		var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
		var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
		var _angle = o_reticle.direction;
		break;
			
}
//set_movement(_angle, 4);
//set_move_n(_angle, 24);


#region Set Move
var jump     = true;//o_input.action_four_pressed_;
var walk_speed, jump_speed;
walk_speed = 24;
jump_speed = 5;
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

if animation_hit_frame(6)
{
	switch global.gamepad_active {
		
		case false:
		var _angle = point_direction(x, y, o_input.xdir_, o_input.ydir_);
		break;
		
		case true:
		var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
		var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
		var _angle = o_reticle.direction;
		break;
			
	}
	var _life = 2;
	var _damage = 4;
	var _knockback = 0;
	var _hitbox = create_hitbox(s_player_uppercut_hitbox, x, y, _angle, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
	audio_play(_attack_sound);
	_hitbox.lift = true;
	global.auto_jump_ = true;
	
	/*spd*dcos(_angle);
	spd*-dsin(_angle);*/
	
	#region Set Mov
/*
	var jump     = o_input.action_four_pressed_;
	var walk_speed, jump_speed;
	walk_speed = 15;
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
	*/
	#endregion
	
	switch direction_facing_
	{
		case dir.up: _hitbox.y -= 6; break;
		default: _hitbox.y -= 6; break;
	}
}

if animation_hit_frame(7)
{
	alarm[4] = 10;
	anim_cancel = true;
}

if _evade_input >= .7 and global.player_stamina >= evade_stamina_cost_ and anim_cancel {
	image_index = 0;
	state_ = player.evade;
	global.player_stamina -= evade_stamina_cost_;
	global.player_stamina = max(0, global.player_stamina);
	var _evade_sound = choose(a_player_dash_1, a_player_dash_2, a_player_dash_3);
	audio_play(_evade_sound);
}

if animation_hit_frame(image_number - 1)
{
		state_ = starting_state_
		attacking_ = false;
		global.auto_jump_ = false;
}