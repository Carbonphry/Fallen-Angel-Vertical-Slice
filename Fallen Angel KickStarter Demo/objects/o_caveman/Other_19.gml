/// @description Lifted
// You can write your code in this editor
with instance_create_depth(x,y-z,depth+1,o_jump_mb) {
	sprite_index = other.sprite_index;
	image_index = other.image_index;
	image_xscale = other.image_xscale;
}
if animation_hit_frame(0) {
	var ef = create_animation_effect(s_red_sparks_effect,x,y-10,0.8,true);
	ef.depth = depth-1;
}


if z <= z_ground
{
	if !audio_is_playing(a_enemy_getup) {
		audio_play(a_enemy_getup);
	}
	jump = false;
	bleed_ = true;
	add_screenshake(3,10);
	state_ = caveman.get_up;
	
} else {
	if !audio_is_playing(a_enemy_lifted) {
		audio_play(a_enemy_lifted);
	}
}
