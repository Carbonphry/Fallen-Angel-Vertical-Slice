/// @description Insert description here
// You can write your code in this editor

if animation_hit_frame(4) and spawn {
	var en = instance_create_layer(x,y,"Enemies",enemy_);
	en.health_ = en.max_health_/2;
	spawn = false;
}