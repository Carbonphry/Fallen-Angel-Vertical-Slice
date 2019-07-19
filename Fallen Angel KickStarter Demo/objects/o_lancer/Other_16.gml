/// @description Die State
image_speed = .8;
sprite_index = s_lancerangel_die;
_speed_ = 0;
if (die_sound = false)
{
	audio_play_sound(a_enemy_die, 7, false);
	die_sound = true;
}	

/*
if animation_hit_frame(3)
{
	instance_create_layer(x-irandom_range(5, -15), y-irandom_range(25, 0), "Effects", o_blood_burst);
	instance_create_layer(x-irandom_range(5, -15), y-irandom_range(25, 0), "Effects", o_blood_burst);
}