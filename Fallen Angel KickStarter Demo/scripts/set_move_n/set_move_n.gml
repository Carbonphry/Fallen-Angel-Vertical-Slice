/// @description set_move_n(angle,speed)
/// @param angle
/// @param speed


//var _angle = o_reticle.image_angle;
#region Set Mov
var _angle = argument0;
//var wea = argument0;
var walk_speed;
walk_speed = argument1;
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
		if place_meeting(x - (other.right - other.left), y, other)
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
    
    if can_move == true
        x += (right - left)*dcos(_angle);
}


repeat(abs(walk_speed * (down - up)))
{
    
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
	
    if can_move == true
        y += (down - up)*-dsin(_angle);
}

/*repeat(abs(walk_speed * (right - left)))
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
	
	with class_enemy_coll 
	{
		if place_meeting(x - (other.right - other.left), y, other)
            {
                other.can_move = false;
            }
    }
	
    
    if can_move == true
        //x += (right - left)*dcos(_angle);
		 x += lengthdir_x(1,_angle); 
	//spd*-dsin(_angle);
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
	
	with class_enemy_coll
	{
		if place_meeting(x , y- (other.down - other.up), other)
           {
                other.can_move = false;
                break;
           }
	
	}
	
    if can_move == true
        //y += lengthdir_y(down - up,_angle); 
		 y += lengthdir_y(1,_angle); 
	//	(down - up)*-dsin(_angle);
}*/


#endregion