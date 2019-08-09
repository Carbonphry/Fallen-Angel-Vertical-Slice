/// @description Lifted
// You can write your code in this editor
if animation_hit_frame(0) {
var ef = create_animation_effect(s_red_sparks_effect,x,y-10,0.8,true);
	ef.depth = depth-1;
}

sprite_index = s_tankangel_lifted;
image_speed = .6;
if z == z_ground
{
	if !audio_is_playing(a_enemy_getup) {
		audio_play(a_enemy_getup);
	}
	add_screenshake(4,12);
	state_ = tankangel.get_up;
	add_screenshake(3,10);
} else {
	if !audio_is_playing(a_enemy_lifted) {
		audio_play(a_enemy_lifted);
	}
	
	if animation_hit_frame(0.2) {
		var target = instance_nearest(x,y,class_player);
		if x < target.x {
			image_xscale = 1;
		} else {
		   image_xscale = -1;
		}
	}
	//x += 1.7;
	var val = lengthdir_x(2,heavyknockdir);
	if !place_meeting(x+val,y,class_enemy_coll) {
		x += val;
	}
	
}



