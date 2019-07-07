/// @description Insert description here
// You can write your code in this editor
event_inherited(); 
if alarm_get(8) > 0 {
	var life_size = max(health_/max_health_,0);
	//draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	
	draw_sprite_ext(s_hp_bar_8, 0, x,y-sprite_height/2-z, 1, 1, 0, c_white, 1);
	draw_sprite(s_8_hp,health_,x,y-sprite_height/2-z);
}

var _glow = 0.4;
var _x_pos = x;
var _y_pos = y -11;

gpu_set_blendmode(bm_add);
draw_sprite_ext(s_warm_glow,0,_x_pos,_y_pos-z,0.15,0.15,0,c_orange,_glow);
gpu_set_blendmode(bm_normal);

