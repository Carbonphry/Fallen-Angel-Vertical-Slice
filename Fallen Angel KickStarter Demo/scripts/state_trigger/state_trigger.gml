gml_pragma("forceinline");
image_speed = .8;
image_xscale = 1;

switch power_stance {

	case false:
	sprite_[player.trigger, dir.right] = s_player_burst_right;
	sprite_[player.trigger, dir.up] = s_player_burst_up;
	sprite_[player.trigger, dir.left] = s_player_burst_left;
	sprite_[player.trigger, dir.down] = s_player_burst_down;
	break;

	case true:
	sprite_[player.trigger, dir.right] = s_player_power_burst_right;
	sprite_[player.trigger, dir.up] = s_player_power_burst_up;
	sprite_[player.trigger, dir.left] = s_player_power_burst_left;
	sprite_[player.trigger, dir.down] = s_player_power_burst_down;
	break;
}

if triggerCount == 0 {
		
		switch global.gamepad_active {
		
			case false:
			mouseDir = point_direction(o_player.x, o_player.y, mouse_x, mouse_y);
			break;
		
			case true:
			if rStick != noone {
				mouseDir = rStick;
			} else {
				mouseDir = o_reticle.direction;
			}
			/*var _aim_input = gamepad_axis_value(global.pad[0], gp_axisrh) or gamepad_axis_value(global.pad[0], gp_axisrv);
			var xaxis_ = gamepad_axis_value(global.pad[0], gp_axislh);
			var yaxis_ = gamepad_axis_value(global.pad[0], gp_axislv);
			if ((xaxis_ >= 0.2) || (yaxis_ >= 0.2) || (xaxis_  <= -0.02) || (yaxis_  <= -0.02))
			{
				mouseDir = point_direction(0,0,xaxis_, yaxis_)
			}*/
			break;
		
		}
		
		
		if o_input.action_three_released_ or right_stick {
		//state_ = starting_state_;
		triggerCount = 1;
		
	} else {
			/*
		switch direction_facing_ {
	
			case dir.right:
			draw_sprite_ext(s_projectile_reticle,image_index,x-1,y-17,1,1,mouseDir,c_white,1);
			break;
	
			case dir.left:
			draw_sprite_ext(s_projectile_reticle,image_index,x-2,y-21,1,1,mouseDir,c_white,1);
			break;
	
			case dir.up:
			draw_sprite_ext(s_projectile_reticle,image_index,x+7,y-19,1,1,mouseDir,c_white,1);
			break;
	
			case dir.down:
			draw_sprite_ext(s_projectile_reticle,image_index,x-5,y-19,1,1,mouseDir,c_white,1);
			break;
	}*/
	
	}
		
} 	
	if reticle_anim < 15 {
		reticle_anim += .3;
	} 
	
	switch direction_facing_ {
	
			case dir.right:
			draw_sprite_ext(s_projectile_reticle,reticle_anim,x-1,y-17,-1,1,mouseDir,c_white,1);
			break;
	
			case dir.left:
			draw_sprite_ext(s_projectile_reticle,reticle_anim,x-2,y-21,-1,1,mouseDir,c_white,1);
			break;
	
			case dir.up:
			draw_sprite_ext(s_projectile_reticle,reticle_anim,x+7,y-19,-1,1,mouseDir,c_white,1);
			break;
	
			case dir.down:
			draw_sprite_ext(s_projectile_reticle,reticle_anim,x-5,y-19,-1,1,mouseDir,c_white,1);
			break;
	}

	
	if triggerCount == 1 {
		shoot_trigger();
	} 
    
	if triggerCount >=1 {
		triggerCount++;
	} 
	
	
	
	direction_facing_ = round(mouseDir/90);
	if direction_facing_ == 4
	{
		direction_facing_ = 0;
	}
	
	switch power_stance {

		case false:
		var burst_arm = s_player_burst_arm;
		break;

		case true:
		var burst_arm = s_player_power_burst_arm;
		break;
	}
	if burst_arm_anim < 11 {
		burst_arm_anim +=.27;
	}
	
	switch direction_facing_ {
			
			case dir.right:
			draw_sprite_ext(burst_arm,burst_arm_anim,x-1,y-17,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			break;
	
			case dir.left:
			draw_sprite_ext(burst_arm, burst_arm_anim,x-2,y-21,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			break;
	
			case dir.up:
			draw_sprite_ext(burst_arm, burst_arm_anim,x+7,y-19,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			break;
	
			case dir.down:
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(burst_arm, burst_arm_anim,x-5,y-19,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			break;
	}
	
	if triggerCount == 7 {
		shoot_trigger();
	} 
	
	if triggerCount >= 13 {
		shoot_trigger();
		state_ = starting_state_;
		reticle_anim = 0;
		burst_arm_anim = 0;
		triggerCount = 0;
		rStick = noone;
		o_input.alarm[2] = global.one_second*0.5;
	}	