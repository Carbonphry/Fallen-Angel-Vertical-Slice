

image_alpha = (o_pride_meter.ego_pts/40);
gpu_set_blendmode(bm_add);
draw_sprite_ext(s_pride_demonmode,image_index,o_pride_meter.x,o_pride_meter.y,1,1,0,c_white,image_alpha);
gpu_set_blendmode(bm_normal);