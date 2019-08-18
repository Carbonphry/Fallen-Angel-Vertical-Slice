/*if (state_ == player.move or state_ == player.idle) and z == 0 {
	move_movement_entity(true);
	apply_friction_to_movement_entity();

	var _direction = point_direction(other.x, other.y, x, y);
	set_movement(_direction, 5);	
} else */
//if place_meeting(other.x,y,o_)

if ((state_ == player.idle or state_ == player.move or state_ == player.smash or state_ == player.ram) and z <= 0 ) {
	state_ = player.falling;
	switch room {
	
		case r_intro_room2:
		alarm_set(8,global.one_second*.5);
		break;
		
		case r_intro_room3:
		alarm_set(8,global.one_second*.25);
		break;
		
		case r_intro_room3_2:
		alarm_set(8,global.one_second*.4);
		break;
		
		case r_gabriel_ancientcity_room1:
		alarm_set(8,global.one_second*1);
		break;
		
		default:
		alarm_set(8,global.one_second*.5);
		break;
	}
	
}





