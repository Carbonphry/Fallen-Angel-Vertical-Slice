/// @description Stun
// You can write your code in this editor
sprite_index = s_tankangel_stun;	

image_speed = .9;
speed_ = 0;
parriable = false;


var ef = create_animation_effect(s_red_sparks_effect,x,y-10,0.8,true);
	ef.depth = depth-1;
