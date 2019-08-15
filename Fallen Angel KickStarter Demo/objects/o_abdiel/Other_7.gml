

if sprite_index == s_abdiel_knockback {
	stun_knockback_direction = noone;
	state_ = choose(abdiel.idle,abdiel.idle,abdiel.wander);
}

if sprite_index == s_abdiel_death {
	instance_destroy(id,true);
}

if sprite_index == s_abdiel_dyingend {
	sprite_index = s_abdiel_death;
}

if sprite_index == s_abdiel_dying_loop and !audio_is_playing(a_abdiel_voice_death) {
	sprite_index = s_abdiel_dyingend;
}


if sprite_index == s_abdiel_dying_start {
	sprite_index = s_abdiel_dying_loop;
}



