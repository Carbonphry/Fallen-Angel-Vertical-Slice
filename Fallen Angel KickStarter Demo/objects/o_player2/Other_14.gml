///@description Evade State
image_speed = .85;
evading_ = true;
#region New mov

var jump     = o_input2.action_four_pressed_;
var walk_speed, jump_speed;
walk_speed = 11;
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
	
    if can_move == true
        y += (down*diag - up*diag);
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
//set_movement(roll_direction_, roll__speed_);

instance_create_layer(o_player.x, o_player.y-o_player.z, "Effects", o_particle_dash);
//instance_create_depth(o_player.x, o_player.y-o_player.z, o_player.depth, o_particle_dash);


if animation_hit_frame(0) {
	left     = o_input2.left_;
	right    = o_input2.right_;
	up       = o_input2.up_;
	down     = o_input2.down_;	
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

if animation_hit_frame(image_number - 1)
{
		state_ = player.move;
		evading_ = false;
		//collision_object_ = o_solid_l2
}

//Attack Dash Skill
if (global.dash_attack or power_stance) {

if o_input2.action_one_ {
	
	if !instance_exists(o_dash_attack) {
		audio_play(a_player_slashdash);
		var _angle = direction_facing_*90;//point_direction(x, y, o_input2.xdir_, o_input2.ydir_);
		var _life = 0;
		var _damage = 1;
		var _knockback = 4;
		create_hitbox_dash_attack(x, y-4, _angle, _life, [o_enemy, o_grass, o_bush], _damage, _knockback);
		//audio_play(a_player_slashdash);
		
	}
}
}