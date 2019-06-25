//draw_sprite(s_medium_shadow, 0, x, y );
if !place_meeting(x,y,o_solid_air) {
	draw_sprite_ext(s_medium_shadow, image_index, x, y - z_ground, 1, 1, image_angle, image_blend, image_alpha);
}
//draw_self();
//draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, -image_yscale*.75, 350, c_gray, .7);

/*switch (power_stance) {

	case false:
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	break;
	
	case true:
	DissolveAmount = 1 + ((0 - 1) * 0.5) + sin((((current_time * 0.005) + 8 * 0) / 8) * (pi*2)) * ((0 - 1) * 0.5); 
	//antiDiss = 1-DissolveAmount; 
	//draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	DissolveShader(sprite_index,image_index,x,y,DissolveAmount);
	break;

}*/

if state_ == player.evade {
	DissolveAmount += 0.03; 
	//antiDiss = 1-DissolveAmount; 
	//draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	DissolveShader(sprite_index,image_index,x,y-z,DissolveAmount);
	//draw_text(x,y,string(DissolveAmount))
} else {
	//DissolveAmount = 0;
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, c_red, image_alpha);
}


draw_self_flash(c_white, 8, alarm[0]);

if jump_slash {
	if animSlash == 8 {
		jump_slash = false;
		animSlash = 0;
		exit;
	}
	
	if animSlash == 1 {
		var _life = 3;
		var _damage = 1;
		var _knockback = 4;
		var _hitbox = create_hitbox(s_player_jump_attack, x, y, 0, _life, [o_enemy, o_grass, o_bush, o_shrine], _damage, _knockback);
		_hitbox.lift = true;
	}
	draw_sprite(s_player_jump_attack,animSlash,x,y-z);
	animSlash+=.25;
}
