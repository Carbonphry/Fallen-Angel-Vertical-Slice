/// @description Insert description here
// You can write your code in this editor
image_speed = .9;
enemy_ = noone;
spawn = true;
randomize();
var sound = choose(a_enemy_spawn_1, a_enemy_spawn_2, a_enemy_spawn_3);
audio_play_sound_at(sound, x, y, 0, 100, 300, 1, false, 3);
depth = -9000;