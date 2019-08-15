/// @description Die State
image_speed = .8;
audio_stop_sound(a_music_abdiel);
_speed_ = 0;

if sprite_index == s_abdiel_dying_loop and death_line {
	audio_play(a_abdiel_voice_death);
	death_line = false;
}

if sprite_index != s_abdiel_death then exit;
add_screenshake(4,20);
if (die_sound = false)
{
	audio_play_priority(a_abdiel_death);
	die_sound = true;
}	



if animation_hit_frame(3)
{
	instance_create_layer(x-irandom_range(5, -15), y-irandom_range(25, 0), "Effects", o_blood_burst);
	instance_create_layer(x-irandom_range(5, -15), y-irandom_range(25, 0), "Effects", o_blood_burst);
}


