/// @description Insert description here
// You can write your code in this editor

//Wave back and forth between 1 and 0 for the demo
draw_sprite(s_large_shadow1, 0, x, y);
//draw_self();
//draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
//if (state_ == abdiel.die /*or state_ = abdiel.intro*/) {
//	DissolveAmount -= 0.0007;//1 + ((0 - 1) * 0.5) + sin((((current_time * 0.005) + 8 * 0) / 8) * (pi*2)) * ((0 - 1) * 0.5); 
	//antiDiss = 1-DissolveAmount; 
	//DissolveShader(sprite_index,image_index,x,y,.5);
	//draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
//} else {
	draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	
	if health_ < 1 {
		var shaderAmmount = .9;
	} else {
		var shaderAmmount = (max_health_/health_)/25;
	}
	//if health_ > 0 {
	DissolveAmount = shaderAmmount;
	//} 
	///1 + ((0 - 1) * 0.5) + sin((((current_time * 0.001) + 8 * 0) / 8) * (pi*2)) * ((0 - 1) * 0.5); 
	//antiDiss = 1-DissolveAmount; 
	DissolveShader(sprite_index,image_index,x,y,DissolveAmount);
//}
draw_self_flash(c_red, 6, alarm[0]);

//Draw the sprite using the shader, that's it!
