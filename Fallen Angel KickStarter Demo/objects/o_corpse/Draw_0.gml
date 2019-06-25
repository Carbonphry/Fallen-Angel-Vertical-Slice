/// @description Insert description here
// You can write your code in this editor
draw_self();

if alph < .4 {
	alph +=0.005;
}
draw_sprite_ext(darken_spr,0,x,y,image_xscale,image_yscale,image_angle,image_blend,alph);