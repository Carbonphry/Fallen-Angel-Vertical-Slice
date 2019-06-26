gml_pragma("forceinline");
image_speed = .8;
image_xscale = 1;
	
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
	
	
	
	
	if triggerCount == 7 {
		shoot_trigger();
	} 
	
	if triggerCount >= 13 {
		shoot_trigger();
		state_ = starting_state_;
		triggerCount = 0;
		rStick = noone;
		o_input.alarm[2] = global.one_second*0.5;
	}	