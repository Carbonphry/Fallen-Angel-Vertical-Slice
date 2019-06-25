/// @description Intro State
image_speed = .8;

if animation_hit_frame(0) and sprite_index != s_abdiel_idle {
	audio_play_priority(a_abdiel_intro);
	o_camera.target_ = id;
}

if animation_hit_frame(image_number-1) and sprite_index == s_abdiel_intro {
	sprite_index = s_abdiel_idle;
}

//Exit state
if !instance_exists(o_text) and alarm[5] <= 0 {
		alarm_set(5, global.one_second*.5);
		instance_activate_object(camera_boss);
		o_camera.target_ = o_player;
}