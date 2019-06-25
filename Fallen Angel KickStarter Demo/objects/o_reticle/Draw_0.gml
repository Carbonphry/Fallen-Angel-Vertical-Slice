if !instance_exists(o_player) then exit;

if o_player.state_ == player.transition or o_player.state_ == player.intro or o_player.state_ == player.not_playable or o_player.gliding or instance_exists(o_transition)  {
	if image_alpha > 0 {
		image_alpha -=.04;
	}
	
	
} else {
	if image_alpha < .4 {
		image_alpha +=.04;
	}
}

gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y - o_player.z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
gpu_set_blendmode(bm_normal);
