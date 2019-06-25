// Apply friction when sliding on walls
if place_meeting(x+lengthdir_x(speed_, direction_), y+lengthdir_y(speed_, direction_), obj_cube_parent)  {
	apply_friction_to_movement_entity();
}

var _x_speed = lengthdir_x(speed_, direction_);
var _y_speed = lengthdir_y(speed_, direction_);

//if speed_ <= 0 exit; // No need to check for collisions

if place_meeting(x+_x_speed, y, obj_cube_parent) {
	while !place_meeting(x+sign(_x_speed), y, obj_cube_parent) {
		x += sign(_x_speed);
	}

	
}

x += _x_speed;

if place_meeting(x, y+_y_speed, obj_cube_parent) {
	while !place_meeting(x, y+sign(_y_speed), obj_cube_parent) {
		y += sign(_y_speed);
	}
	
	
	
}

y += _y_speed;

// Make sure to update speed and direction
speed_ = point_distance(0, 0, _x_speed, _y_speed);
direction_ = point_direction(0, 0, _x_speed, _y_speed);