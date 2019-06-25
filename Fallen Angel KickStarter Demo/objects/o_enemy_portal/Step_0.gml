/// @description Insert description here
// You can write your code in this editor

if animation_hit_frame(13) and spawn {
	instance_create_layer(x,y,"Enemies",enemy_)
	spawn = false;
}