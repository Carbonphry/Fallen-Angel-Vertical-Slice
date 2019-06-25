#region
left     = o_input.left_;
right    = o_input.right_;
up       = o_input.up_;
down     = o_input.down_;
var jump     = o_input.action_four_;
var walk_speed, jump_speed;
walk_speed = 4;
jump_speed = 3;

if ( left and up ) or (left and down) or (right and up) or (right and down) {
	walk_speed *=.999999999999999945; //99999999999999999999999
}

repeat(abs(walk_speed * (right/2 - left/2)))
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
	
	
	with o_solid_air 
	{
			if place_meeting(x - (other.right - other.left), y, other)
				{
					other.can_move = false;
					break;
				}
	
	}
	
	
    if can_move == true
        x += (right - left);
}


repeat(abs(walk_speed * (down/2 - up/2)))
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
	
	
	with o_solid_air 
	{
		if place_meeting(x , y- (other.down - other.up), other)
			{
				other.can_move = false;
				break;
			}
	
		}
	
	
    if can_move == true
        y += (down - up);
}


if jump and z = z_ground {
    z_speed = jump_speed;
	audio_play(a_player_jump);
	add_screenshake(1.5,30);
	instance_create_layer(x,y,"Effects", o_jumpcloud);
	alarm_set(7,global.one_second*.4);
}

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

