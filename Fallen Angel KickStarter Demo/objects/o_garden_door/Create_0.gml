/// @description Insert description here
// You can write your code in this editor
with GA_1_START {
	if distance_to_object(o_player) > 25 {
		with other {
			instance_destroy();
		}
	}
}

image_speed = .4;
depth = -y-100;
audio_play(a_cube_appear)