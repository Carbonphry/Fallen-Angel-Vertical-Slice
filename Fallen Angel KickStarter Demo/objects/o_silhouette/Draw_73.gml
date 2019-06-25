/// @description Silhouette FX
// You can write your code in this editor
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);


with (par_objects) {
	switch(object_index) {
	
		case o_player: gpu_set_fog(true,merge_color(c_black,c_maroon,.5),0,1); break;
		//case o_enemy: gpu_set_fog(true,c_blue,0,1); break;
		default: gpu_set_fog(true,c_dkgray,0,1); break;
	}
	draw_self();
}
gpu_set_fog(false,c_white,0,0);

gpu_set_alphatestenable(false);
gpu_set_blendenable(bm_normal);