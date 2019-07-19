/// @description Hit State
sprite_index = s_missileangel_damage;
image_speed = .6;
//move_movement_entity(true);
apply_friction_to_movement_entity();

if _speed_ == 0  {
	state_ = starting_state_;
}
