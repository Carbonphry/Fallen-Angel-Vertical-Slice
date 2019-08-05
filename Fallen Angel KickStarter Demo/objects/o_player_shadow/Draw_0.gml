/// @description Insert description here
// You can write your code in this editor
depth =-y;
x = target.x;
y = target.y;
if !place_meeting(x,y,o_solid_air) and target.state_ != player.glide {
	
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
	
	draw_sprite_ext(s_large_shadow1, image_index, x, y - target.z_ground, shascale, shascale, image_angle, image_blend, image_alpha); 
}