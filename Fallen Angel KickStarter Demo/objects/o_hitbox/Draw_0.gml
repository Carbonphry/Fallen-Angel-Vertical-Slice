/// @description Insert description here
// You can write your code in this editor
if sprite_index == s_whip_effect {
	if place_meeting(x,y,o_enemy) {
				o_pride_meter.ego_add += PTS_PARRY;	
				image_index = 2;
				sprite_index = s_whip_parried;
		}
}
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,1);