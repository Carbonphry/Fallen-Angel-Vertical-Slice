gml_pragma("forceinline");
image_speed = .8;
image_xscale = 1;

/*if o_input.action_three_released_ {
	state_ = starting_state_;
	reticle_anim = 0;
	burst_arm_anim = 0;
	triggerCount = 0;
	rStick = noone;
	o_input.alarm[2] = global.one_second*0.5;
}*/

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
		
		
		if (o_input.action_three_released_ or right_stick) and triggerCount == 0 and global.player_stamina > 0 {
			set_vibration(.3,.3,.2);
			switch power_stance {
			
				case false:
				if reticle_anim >=12 and reticle_anim <=16 { 
					shoot_trigger();
				} else {
					shoot_trigger_shotgun();
				}
				break;
				
				case true:
				if reticle_anim >=12 and reticle_anim >=16 { 
					shoot_trigger_power_critical();
					
					var _smoke_muff = instance_create_depth(x,y,depth-100,o_smoke_puff);
					_smoke_muff.image_speed = .3;
					_smoke_muff.speed = .2;
					_smoke_muff.direction = mouseDir;
					
					o_input.alarm[6] = global.one_second*.2;
					var rdir = o_reticle.image_angle;
					if rdir  >= 0 and rdir  <= 180 {
						knockback_direction = rdir  + 180;
					} else if rdir  > 180 and rdir  <= 360 {
						knockback_direction = rdir  -180;
					} 
					knockback_ammount = 1;
					
				} else {
					shoot_trigger_shotgun();
				}
				break;
			
			}
			
			triggerCount = 1;
			reticle_anim = 0;
			burst_arm_anim = 0;
			global.ammo_count--;
	} 
	
	if power_stance and reticle_anim >=16 {
		set_vibration(.3,.3,.2);
		shoot_trigger_power_critical();
		var rdir = o_reticle.image_angle;
		if rdir  >= 0 and rdir  <= 180 {
			knockback_direction = rdir  + 180;
		} else if rdir  > 180 and rdir  <= 360 {
			knockback_direction = rdir  -180;
		} 
		
		
		knockback_ammount = 1;
		triggerCount = 1;
		reticle_anim = 0;
		burst_arm_anim = 0;
		global.ammo_count--;
		o_input.alarm[6] = global.one_second*.2;
	}
	
	if reticle_anim < 20 {
		reticle_anim += .25;
	} 
	
	
	
	direction_facing_ = round(mouseDir/90);
	if direction_facing_ == 4
	{
		direction_facing_ = 0;
	}
	
	if power_stance {
		switch direction_facing_ {
	
				case dir.right:
				draw_sprite_ext(s_projectile_reticle_power,reticle_anim,x-1,y-17,-1,1,mouseDir,c_white,1);
				break;
	
				case dir.left:
				draw_sprite_ext(s_projectile_reticle_power,reticle_anim,x-2,y-21,-1,1,mouseDir,c_white,1);
				break;
	
				case dir.up:
				draw_sprite_ext(s_projectile_reticle_power,reticle_anim,x+7,y-19,-1,1,mouseDir,c_white,1);
				break;
	
				case dir.down:
				draw_sprite_ext(s_projectile_reticle_power,reticle_anim,x-5,y-19,-1,1,mouseDir,c_white,1);
				break;
		}
	
	} else {
	
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
	}
} 	
	
	
	if triggerCount >=1 {
		triggerCount++;
	} 
	
	if triggerCount == global.one_second*.25 {
		triggerCount = 0;
		state_ = starting_state_;
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
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(burst_arm,burst_arm_anim,x-1,y-17,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			break;
	
			case dir.left:
			draw_sprite_ext(burst_arm, burst_arm_anim,x-2,y-21,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			break;
	
			case dir.up:
			draw_sprite_ext(burst_arm, burst_arm_anim,x+5,y-19,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			break;
	
			case dir.down:
			draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(burst_arm, burst_arm_anim,x-3,y-19,image_xscale,image_yscale,mouseDir,image_blend,image_alpha );
			break;
	}
	
	
	/*
	
	if triggerCount >= 13 {
		shoot_trigger();
		state_ = starting_state_;
		reticle_anim = 0;
		burst_arm_anim = 0;
		triggerCount = 0;
		rStick = noone;
		o_input.alarm[2] = global.one_second*0.5;
	}	*/