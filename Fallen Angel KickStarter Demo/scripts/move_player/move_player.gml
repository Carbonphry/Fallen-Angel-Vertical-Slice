///@param _bounce
var _bounce = argument0;

/*if ( room == r_garden ) {
	switch (current_layer_) {
	
	case LAYER0:
	collision_object_ = o_solid_l0;
	break;
	
	case LAYER1:
	collision_object_ = o_solid_l1;
	break;
	
	case LAYER2:
	collision_object_ = o_solid_l2;
	break;
	
	case LAYER3:
	collision_object_ = o_solid_l3;
	break;
	
	case LAYER4:
	collision_object_ = o_solid_l4;
	break;
	
	case LAYER5:
	collision_object_ = o_solid_l5;
	break;
	
	}
}*/

// Apply friction when sliding on walls
if place_meeting(x+lengthdir_x(_speed_, direction_), y+lengthdir_y(_speed_, direction_), collision_object_) and !_bounce {
	apply_friction_to_movement_entity();
}

if place_meeting(x+lengthdir_x(_speed_, direction_), y+lengthdir_y(_speed_, direction_), o_enemy) and !_bounce {
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

if place_meeting(x+_x_speed, y,  o_enemy) {
	while !place_meeting(x+sign(_x_speed), y, o_enemy) {
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

if place_meeting(x, y+_y_speed,  o_enemy) {
	while !place_meeting(x, y+sign(_y_speed),  o_enemy) {
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