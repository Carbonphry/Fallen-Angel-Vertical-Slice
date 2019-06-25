/// @description Insert description here
// You can write your code in this editor
event_inherited(); 
var _glow = 0.4;
var _x_pos = x;
var _y_pos = y -11;

gpu_set_blendmode(bm_add);
draw_sprite_ext(s_warm_glow,0,_x_pos,_y_pos-z,0.15,0.15,0,c_orange,_glow);
gpu_set_blendmode(bm_normal);

