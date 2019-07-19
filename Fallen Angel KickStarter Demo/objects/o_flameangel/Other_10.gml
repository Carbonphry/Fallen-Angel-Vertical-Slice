/// @description Hit State
//move_movement_entity(true);
apply_friction_to_movement_entity();
//set_move_n(knockback_direction,knockback_ammount);

if alarm[4] < 0 {
	state_ = starting_state_;
	knockback_direction = noone;
	knockback_ammount = noone;
}

/*1if _speed_ == 0 and z == z_ground {
	state_ = starting_state_;
}
