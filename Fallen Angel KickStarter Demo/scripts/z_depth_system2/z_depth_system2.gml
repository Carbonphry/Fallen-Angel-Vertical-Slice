#region
left     = o_input2.left_;
right    = o_input2.right_;
up       = o_input2.up_;
down     = o_input2.down_;
if state_ == player.land {
	var jump = false;
} else {
	var jump = o_input2.action_four_;
}

var walk_speed, jump_speed;
var grav_mult
walk_speed = 4;
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
    
    if can_move == true and ( x > camera_get_view_x(view_camera[0])+20 ) /*and (x < camera_get_view_x(view_camera[0])+460)*/ {
        x += (right*diag - left*diag);
		/*if (x > camera_get_view_x(view_camera[0]) +20) {
			x -= 6;
		} 
		if x < camera_get_view_x(view_camera[0])+460 {
			x +=6;
		}*/
	}
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
	
    if can_move == true  and y > camera_get_view_y(view_camera[0])+10 /*and y < camera_get_view_y(view_camera[0])+250*/
        y += (down*diag - up*diag);
		/*if y > camera_get_view_y(view_camera[0])+10 {
			y -= 6;
		}
		if y < camera_get_view_y(view_camera[0])+250 {
			y+=6;
		}*/
		
}

/////////////////////////
if jump and z == z_ground {
    z_speed = jump_speed;
	audio_play(a_player_jump);
	add_screenshake(1.5,30);
	instance_create_layer(x,y,"Effects", o_jumpcloud);
	alarm_set(7,global.one_second*.4);
}

if jump and z == z_ground {
    z_speed = 6;
	audio_play(a_player_jump);
	add_screenshake(1.5,30);
	instance_create_layer(x,y,"Effects", o_jumpcloud);
	alarm_set(7,global.one_second*.4);
}

    
if alarm_get(7) >0 {
	if jump {
		z_speed += 0.2;
	} else {
		alarm[7] = 0;
	}
}
last_z = z;
z += z_speed;
z_speed -= z__speed_gravity;

if o_player2.state_ == player.smash
{
	grav_mult = 0.05;
	z__speed_gravity += grav_mult;
} else
{
grav_mult = 0;
z__speed_gravity = .25;
}

///////////////////
if z <= z_ground
{
    z = z_ground;
    z_speed = 0;
}

/*if z == z_ground and last_z > 0 {
	state_ = player.land;
}*/

if !place_meeting(x, y, obj_cube_parent)
    z_ground = 0;
	
#endregion

