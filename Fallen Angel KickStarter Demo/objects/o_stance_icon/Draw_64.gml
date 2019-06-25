/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_player) then exit;

draw_self();
image_speed = .6;



if o_player.z == o_player.z_ground {
	if o_player.power_stance {
		sprite_index = s_hud_stance_power;
	} else {
		sprite_index = s_hud_stance;
	}
} else {
	sprite_index = s_hud_stance_flying;
}



if anim != 6 {
	draw_sprite(s_hud_stance_on_effect,anim,x+1,y-4);
	anim +=.2;
}
if anim >= 5 {
	anim = 6;
}