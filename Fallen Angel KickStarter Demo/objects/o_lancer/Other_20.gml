/// @description Lifted
// You can write your code in this editor
if z <= z_ground
{
	if !audio_is_playing(a_enemy_getup) {
		audio_play(a_enemy_getup);
	}
	jump = false;
	bleed_ = true;
	add_screenshake(3,10);
	state_ = lancer.get_up;
	
} else {
	if !audio_is_playing(a_enemy_lifted) {
		audio_play(a_enemy_lifted);
	}
}
