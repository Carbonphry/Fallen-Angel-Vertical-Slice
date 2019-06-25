/// @description Insert description here
// You can write your code in this editor
if alarm_get(0) <= 0 {
	image_speed =-.9;
	if (!audio_is_playing(a_cube_disappear)) {
		audio_play(a_cube_disappear);
	}
	if image_index <= 1 {
		instance_destroy();
	}
}