/// @description Play dungeon music back
// You can write your code in this editor
event_inherited();
//audio_play_sound(a_music_dungeon,1,true);
audio_stop_sound(a_music_abdiel);
instance_deactivate_object(block_fight);
instance_deactivate_object(camera_boss);
instance_create_depth(0,0,-99999,o_fade_in_ending);