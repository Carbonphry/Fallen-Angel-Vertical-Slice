/// @description Insert description here
// You can write your code in this editor
depth =-y;
x = target.x;
y = target.y- target.z_ground;
var _air_solid = instance_nearest(x,y,o_solid_air);

if place_empty(x,y,_air_solid)	{
	switch (target.z) {
	
		case 0:
		if shascale > .5 {
			shascale -= 0.02;
		} else {
			shascale = .5;
		}
		break;
	
		default:
		if shascale < 1 {
			shascale += 0.02;
		} else {
			shascale = 1;
		}
		
		break;
	}
	
	draw_sprite_ext(s_large_shadow1, image_index, x, y, shascale, shascale, image_angle, image_blend, image_alpha); 
}