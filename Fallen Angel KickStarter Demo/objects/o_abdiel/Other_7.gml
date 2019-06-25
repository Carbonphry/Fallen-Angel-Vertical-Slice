if (sprite_index = s_abdiel_death) {
	instance_destroy(id,true);
}

if sprite_index == s_abdiel_knockback {
	stun_knockback_direction = noone;
	state_ = choose(abdiel.idle,abdiel.idle,abdiel.wander);
}