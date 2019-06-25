/*if (state_ == player.move or state_ == player.idle) and z == 0 {
	move_movement_entity(true);
	apply_friction_to_movement_entity();

	var _direction = point_direction(other.x, other.y, x, y);
	set_movement(_direction, 5);	
} else */
if ((state_ == player.idle or state_ == player.move) and z <= 0 ) {
	state_ = player.falling;
	alarm_set(10,global.one_second*1.2);
}



