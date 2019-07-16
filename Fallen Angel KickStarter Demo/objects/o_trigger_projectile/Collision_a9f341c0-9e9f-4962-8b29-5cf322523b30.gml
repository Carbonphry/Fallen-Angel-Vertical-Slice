/// @description Insert description here
// You can write your code in this editor
impact_ = true;
if alarm[1] <=0 {
	instance_destroy(id,true);
	audio_play(a_player_attack_projectile_hit);
}