//draw_sprite(s_medium_shadow, 0, x, y );

if state_ != player.evade {
	visible = true;
}

/*draw_text(x,y,string(player_spd));
draw_text(x,y+8,string(power_stance));*/
if !place_meeting(x,y,o_solid_air) and state_ != player.glide {
	
	switch (z) {
	
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
	
	draw_sprite_ext(s_large_shadow1, image_index, x, y - z_ground, shascale, shascale, image_angle, image_blend, image_alpha); 
}


if state_ == player.trigger {
	
	if o_input.action_three_released_ {
		//state_ = starting_state_;
		triggerCount++;
	} else {
		
		
		switch direction_facing_ {
	
			case dir.right:
			draw_sprite_ext(s_projectile_reticle,0,x-1,y-17,1,1,mouseDir,c_white,1);
			break;
	
			case dir.left:
			draw_sprite_ext(s_projectile_reticle,0,x-2,y-21,1,1,mouseDir,c_white,1);
			break;
	
			case dir.up:
			draw_sprite_ext(s_projectile_reticle,0,x+7,y-19,1,1,mouseDir,c_white,1);
			break;
	
			case dir.down:
			draw_sprite_ext(s_projectile_reticle,0,x-5,y-19,1,1,mouseDir,c_white,1);
			break;
	}
	}
	
	if triggerCount >=1 {
		triggerCount++;
	} 
	
	
	
	direction_facing_ = round(mouseDir/90);
	if direction_facing_ == 4
	{
		direction_facing_ = 0;
	}
	
	switch direction_facing_ {
	
			case dir.right:
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(s_player_power_burst_arm,image_index,x-1,y-17,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			break;
	
			case dir.left:
			draw_sprite_ext(s_player_power_burst_arm, image_index,x-2,y-21,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			break;
	
			case dir.up:
			draw_sprite_ext(s_player_power_burst_arm, image_index,x+7,y-19,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			break;
	
			case dir.down:
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(s_player_power_burst_arm, image_index,x-5,y-19,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			break;
	}
	
	
	if triggerCount == 0 {
		
		switch global.gamepad_active {
		
			case false:
			mouseDir = point_direction(o_player.x, o_player.y, mouse_x, mouse_y);
			break;
		
			case true:
			mouseDir = o_reticle.direction;
			/*var _aim_input = gamepad_axis_value(global.pad[0], gp_axisrh) or gamepad_axis_value(global.pad[0], gp_axisrv);
			var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
			var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
			if ((xaxis_ >= 0.2) || (yaxis_ >= 0.2) || (xaxis_  <= -0.02) || (yaxis_  <= -0.02))
			{
				mouseDir = point_direction(0,0,xaxis_, yaxis_)
			}*/
			break;
		
		}
		
	} 
	if triggerCount == 1 {
		shoot_trigger();
	} 
	
	if triggerCount == 7 {
		shoot_trigger();
	} 
	if triggerCount >= 13 {
		shoot_trigger();
		state_ = starting_state_;
		triggerCount = 0;
		o_input.alarm[2] = global.one_second*0.5;
	}
} else {
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
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

/*if state_ == player.evade {
	DissolveAmount += 0.03; 
	//antiDiss = 1-DissolveAmount; 
	//draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	DissolveShader(sprite_index,image_index,x,y-z,DissolveAmount);
	//draw_text(x,y,string(DissolveAmount))
} else {
	//DissolveAmount = 0;
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}*/


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

/*
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false,false,false,true);

draw_set_alpha(0);
var x1 = x-sprite_xoffset;
var y1 = y-sprite_yoffset;
draw_rectangle(x1,y1,x1+sprite_width,y1+sprite_height,false);
draw_set_alpha(1);

gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendenable(true);