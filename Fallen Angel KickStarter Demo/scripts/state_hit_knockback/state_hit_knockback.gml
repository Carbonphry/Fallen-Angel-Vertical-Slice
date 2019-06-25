/// @description Hit Knockback State
image_speed = 0.8;
move_movement_entity(true);
apply_friction_to_movement_entity();

if animation_hit_frame(3)
{
	audio_play(a_knockback);
}

z_depth_system_gravity();
