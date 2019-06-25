var _glow = 0.25;
var _x_pos = x;
var _y_pos = y;

draw_self();
gpu_set_blendmode(bm_add);
draw_sprite_ext(s_warm_glow,0,_x_pos,_y_pos,0.1,0.1,0,c_orange,_glow);
gpu_set_blendmode(bm_normal);