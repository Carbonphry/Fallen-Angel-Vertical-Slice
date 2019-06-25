/// @description Hit State
//move_movement_entity(true);
apply_friction_to_movement_entity();

if speed_ == 0 and z == z_ground {
	state_ = starting_state_;
}
