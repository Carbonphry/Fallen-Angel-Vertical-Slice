/// @description Sound
// You can write your code in this editor
if sprite_index = s_player_burst_projectile_critical {
	audio_play(a_player_burstprojectile_precise);
} else {
	audio_play(a_player_burstprojectile);
}