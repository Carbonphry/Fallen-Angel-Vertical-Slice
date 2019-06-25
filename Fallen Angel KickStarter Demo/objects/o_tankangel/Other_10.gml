/// @description Hit State
/*move_movement_entity(true);
apply_friction_to_movement_entity();*/
sprite_index = s_tankangel_knockback;
apply_friction_to_movement_entity();
image_speed = .5;
if image_index == 3{
	state_ = starting_state_;
}
