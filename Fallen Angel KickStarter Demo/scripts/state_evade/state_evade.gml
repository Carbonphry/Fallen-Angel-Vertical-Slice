/// @description Evade State
image_speed = 2;
evading_ = true;

if image_index >= 3 {
	iframe = true;
}

#region New mov

var jump     = o_input.action_four_pressed_;
var walk_speed, jump_speed;
walk_speed = 13;
jump_speed = 3;
var diag = .6;


if ( left and up ) or (left and down) or (right and up) or (right and down) {
	diag = .41;//walk_speed *=.99999999999999999999; //99999999999999999999999
}

repeat(abs(walk_speed * (right - left)))
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

	with o_solid 
	{
		if place_meeting(x - (other.right - other.left), y, other)
            {
                other.can_move = false;
            }
    }
	
	with o_stair_slow
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
                break;
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
    
    if can_move == true
        x += (right*diag - left*diag);
}


repeat(abs(walk_speed * (down - up)))
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
	
	with o_solid 
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
                break;
           }
	
	}
	
	with o_solid 
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
                break;
           }
	
	}
	
	with o_stair_slow
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
                break;
           }
	
	}
	
    if can_move == true
        y += (down*diag - up*diag);
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
//set_movement(roll_direction_, roll_speed_);

//instance_create_layer(o_player.x, o_player.y-o_player.z, "Effects", o_particle_dash);
//instance_create_depth(o_player.x, o_player.y-o_player.z, o_player.depth, o_particle_dash);


if animation_hit_frame(0) {
	//visible = false;
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
}

move_movement_entity(false);

if animation_hit_frame(1) and !instance_exists(trace_1) {
	with instance_create_depth(x,y,depth,trace_1) {
		sprite_index =  other.sprite_[other.state_, other.direction_facing_];
		image_index = 0;
	}
	
} else if animation_hit_frame(2) and !instance_exists(trace_2) {
	/*with instance_create_depth(x,y,depth,trace_2) {
		sprite_index =  other.sprite_[other.state_, other.direction_facing_];
		image_index = 1;
	}*/
	
} else if animation_hit_frame(3) and !instance_exists(trace_3) {
	with instance_create_depth(x,y,depth,trace_3) {
		sprite_index =  other.sprite_[other.state_, other.direction_facing_];
		image_index = 2;
	}
	
} else if animation_hit_frame(4) and !instance_exists(trace_4) {
	/*with instance_create_depth(x,y,depth,trace_4) {
		sprite_index =  other.sprite_[other.state_, other.direction_facing_];
		image_index = 3;
	}*/
	
} else if animation_hit_frame(5) and !instance_exists(trace_5) {
	/*with instance_create_depth(x,y,depth,trace_5) {
		sprite_index =  other.sprite_[other.state_, other.direction_facing_];
		image_index = 4;
	}*/
	
} else if animation_hit_frame(6) and !instance_exists(trace_6) {
	with instance_create_depth(x,y,depth,trace_6) {
		sprite_index =  other.sprite_[other.state_, other.direction_facing_];
		image_index = 5;
	}
	
} 

if place_meeting(x,y,o_lancer) {

	with o_lancer {
		state_ = lancer.stun;
		other.sprite_index = s_player_dash_parry_right;
	}
}


if animation_hit_frame(image_number - 1)
{
		state_ = player.move;
		evading_ = false;
		iframe = false;
		//collision_object_ = o_solid_l2
		visible = true;
}

//Attack Dash Skill
if (global.dash_attack or power_stance) {

if o_input.action_one_ {
	
	if !instance_exists(o_dash_attack) {
		audio_play(a_player_slashdash);
		var _angle = direction_facing_*90;//point_direction(x, y, o_input.xdir_, o_input.ydir_);
		var _life = 0;
		var _damage = 1;
		var _knockback = 4;
		var _hitbox = create_hitbox_dash_attack(x, y-4, _angle, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		//audio_play(a_player_slashdash);
		
	}
}
}