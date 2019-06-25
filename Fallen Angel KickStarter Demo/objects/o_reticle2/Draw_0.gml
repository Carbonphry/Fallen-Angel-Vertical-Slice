if instance_exists(o_player2) {
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y - o_player2.z, image_xscale, image_yscale, image_angle, c_red, image_alpha);
gpu_set_blendmode(bm_normal);
}
