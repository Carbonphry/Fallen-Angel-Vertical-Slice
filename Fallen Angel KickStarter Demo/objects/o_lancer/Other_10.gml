/// @description Hit State
sprite_index = s_lancerangel_damaged;
//move_movement_entity(true);
apply_friction_to_movement_entity();
image_speed = .5;
alarm_set(2,global.one_second*.8);
if image_index == 3 and z == z_ground then state_ = starting_state_;
/*
if speed_ == 0 {
	state_ = starting_state_;
}
