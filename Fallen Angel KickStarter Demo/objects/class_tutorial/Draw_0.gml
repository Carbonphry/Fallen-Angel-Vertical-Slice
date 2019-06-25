/// @description Draw Outline
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y+1,image_xscale,image_yscale,image_angle,c_gray,image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y-1,image_xscale,image_yscale,image_angle,c_gray,image_alpha);
draw_sprite_ext(sprite_index,image_index,x+1,y,image_xscale,image_yscale,image_angle,c_gray,image_alpha);
draw_sprite_ext(sprite_index,image_index,x-1,y,image_xscale,image_yscale,image_angle,c_gray,image_alpha);
draw_self();