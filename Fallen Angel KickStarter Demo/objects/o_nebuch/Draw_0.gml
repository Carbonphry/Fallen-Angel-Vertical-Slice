/// @description Insert description here
// You can write your code in this editor
event_inherited();

if alarm_get(8) > 0 and health_ > 0 {
	//var life_size = max(health_/max_health_,0);
	//draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	
	draw_sprite_ext(s_hp_bar_16, 0, x-13,y-sprite_height/2-z, 1, 1, 0, c_white, 1);
	if health_ > 0 {
		draw_sprite(s_8_hp,health_,x-13,y-sprite_height/2-z);
	} else {
		draw_sprite(s_8_hp,0,x-13,y-sprite_height/2-z);
	}
}