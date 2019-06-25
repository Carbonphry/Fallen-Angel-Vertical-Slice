/// @description Insert description here
// You can write your code in this editor
if !stop {
	//audio_play_sound(a_menu_intro,1,false);
	audio_play_sound(a_menu_snd,1,false);
	stop = true;
}


if !audio_is_playing(a_menu_loop) then audio_play_sound(a_menu_loop,1,true);