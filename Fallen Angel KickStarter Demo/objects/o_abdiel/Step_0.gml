move_movement_entity(true);
//apply_friction_to_movement_entity();

if state_ != abdiel.intro {
	o_camera.target_ = o_player;
}

switch (bounce) {
	
	case true:
	direction_ = point_direction(x, y, o_player.x, o_player.y); 
	bounce = false;
	break;
}

event_inherited();


