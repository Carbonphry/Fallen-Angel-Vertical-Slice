var offset = sprite_height-sprite_yoffset;
depth = -y - offset;

if state_ != noone {
	 event_user(state_);
}



//z_depth_system_enemy();
z_depth_system_enemy();
//move_movement_entity(true);
//move_entity_en(true);
//z_depth_system_enemy();
//apply_friction_to_movement_entity();
/*
#region Solid Air
// Apply friction when sliding on walls
if place_meeting(x+lengthdir_x(speed_, direction_), y+lengthdir_y(speed_, direction_), o_solid_air)  {
	apply_friction_to_movement_entity();
}

var _x_speed = lengthdir_x(speed_, direction_);
var _y_speed = lengthdir_y(speed_, direction_);

//if speed_ <= 0 exit; // No need to check for collisions

if place_meeting(x+_x_speed, y, o_solid_air) {
	while !place_meeting(x+sign(_x_speed), y, o_solid_air) {
		x += sign(_x_speed);
	}

	
}

x += _x_speed;

if place_meeting(x, y+_y_speed, o_solid_air) {
	while !place_meeting(x, y+sign(_y_speed), o_solid_air) {
		y += sign(_y_speed);
	}
	
	
	
}

y += _y_speed;

// Make sure to update speed and direction
speed_ = point_distance(0, 0, _x_speed, _y_speed);
direction_ = point_direction(0, 0, _x_speed, _y_speed);

#endregion

*/
if (last_sprite != sprite_index) 
{
   image_index = 0;
   last_sprite = sprite_index;
}

if z>0 and health_>0 {
	state_ = enemy.hit;
}

if health_ <=0 then state_ = cherub.die;