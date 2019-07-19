var _bounce = argument0;

// Apply friction when sliding on walls
if place_meeting(x+lengthdir_x(_speed_, direction_), y+lengthdir_y(_speed_, direction_), collision_object_) and !_bounce {
	apply_friction_to_movement_entity();
}

var _x_speed = lengthdir_x(_speed_, direction_);
var _y_speed = lengthdir_y(_speed_, direction_);

//if _speed_ <= 0 exit; // No need to check for collisions

if place_meeting(x+_x_speed, y, collision_object_) {
	while !place_meeting(x+sign(_x_speed), y, collision_object_) {
		x += sign(_x_speed);
	}
	
	if _bounce {
		_x_speed = -(_x_speed)*bounce_amount_;
	} else {
		_x_speed = 0;
	}
	
}

if place_meeting(x+_x_speed, y, o_solid_air) {
	while !place_meeting(x+sign(_x_speed), y, o_solid_air) {
		x += sign(_x_speed);
	}
	
	if _bounce {
		_x_speed = -(_x_speed)*bounce_amount_;
	} else {
		_x_speed = 0;
	}
	
}

if place_meeting(x+_x_speed, y, obj_cube_parent) {
	while !place_meeting(x+sign(_x_speed), y, obj_cube_parent) {
		x += sign(_x_speed);
	}
	
	if _bounce {
		_x_speed = -(_x_speed)*bounce_amount_;
	} else {
		_x_speed = 0;
	}
	
}

x += _x_speed;

if place_meeting(x, y+_y_speed, collision_object_) {
	while !place_meeting(x, y+sign(_y_speed), collision_object_) {
		y += sign(_y_speed);
	}
	
	if _bounce {
		_y_speed = -(_y_speed)*bounce_amount_;
	} else {
		_y_speed = 0;
	}
	
}

if place_meeting(x, y+_y_speed, o_solid_air) {
	while !place_meeting(x, y+sign(_y_speed), o_solid_air) {
		y += sign(_y_speed);
	}
	
	if _bounce {
		_y_speed = -(_y_speed)*bounce_amount_;
	} else {
		_y_speed = 0;
	}
	
}

if place_meeting(x, y+_y_speed, obj_cube_parent) {
	while !place_meeting(x, y+sign(_y_speed), obj_cube_parent) {
		y += sign(_y_speed);
	}
	
	if _bounce {
		_y_speed = -(_y_speed)*bounce_amount_;
	} else {
		_y_speed = 0;
	}
	
}

y += _y_speed;

// Make sure to update speed and direction
_speed_ = point_distance(0, 0, _x_speed, _y_speed);
direction_ = point_direction(0, 0, _x_speed, _y_speed);