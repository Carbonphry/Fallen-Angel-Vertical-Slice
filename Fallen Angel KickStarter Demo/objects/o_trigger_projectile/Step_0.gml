if sprite_index = s_player_burst_projectile_critical
{
	if !audio_is_playing(a_player_burstprojectile_precise) {
		audio_play(a_player_burstprojectile_precise);
	}
}
