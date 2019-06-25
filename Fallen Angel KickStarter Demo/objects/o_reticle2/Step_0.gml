//depth = -y-11;


if instance_exists(o_player2)
{
	depth = o_player2.depth-50;
	var Angle = point_direction(o_player2.x, o_player2.y, mouse_x, mouse_y); // Current orbital angle
	var _attack_input = o_input2.action_one_pressed_;

	Angle += Speed;
	if(Angle >= 360) Angle -= 360;
	
	
	
		
		
		/*var right_h_axis = gamepad_axis_value(global.pad[0], gp_axisrh);
		var right_v_axis = gamepad_axis_value(global.pad[0], gp_axisrv);
		var min_range = 25;
		var max_range = 25;
		
		var dist = point_distance(0, 0, right_h_axis, right_v_axis); 
		if (dist > 0) {
			final_dist = scr_map(dist, 0, 1, min_range, max_range);
			final_dir = point_direction(0, 0, right_h_axis, right_v_axis);
		} else {
			final_dist = min_range;
		}
		x = o_player.x + lengthdir_x(final_dist, final_dir);
		y = o_player.y + lengthdir_y(final_dist, final_dir);
		
		xaxis_ = gamepad_axis_value(global.pad[0], gp_axisrh);
		yaxis_ = gamepad_axis_value(global.pad[0], gp_axisrv);
		if ((xaxis_ >= 0.2) || (yaxis_ >= 0.2) || (xaxis_  <= -0.02) || (yaxis_  <= -0.02))
		{
			direction = point_direction(0,0,xaxis_, yaxis_)
		}
		image_angle = direction;*/
		
		var _aim_input = gamepad_axis_value(0, gp_axisrh) or gamepad_axis_value(0, gp_axisrv);
		xaxis_ = gamepad_axis_value(0, gp_axislh);
		yaxis_ = gamepad_axis_value(0, gp_axislv);
	
		var _attack_input = o_input2.action_one_pressed_;
	
		if ((xaxis_ >= 0.2) || (yaxis_ >= 0.2) || (xaxis_  <= -0.02) || (yaxis_  <= -0.02))
		{
			direction = point_direction(0,0,xaxis_, yaxis_)
		}
  
		targetx = o_player2.x + lengthdir_x(Orbit,direction);
		targety = o_player2.y + lengthdir_y(Orbit,direction);
      
		x += (targetx - x);
		y += (targety - y);
	
		image_angle = direction;
	

	if (_attack_input == true and o_player2.throwing_ == false and o_player2.evading_ == false)
	{
		sprite_index = s_reticle_attack;
	}
	
	if instance_exists(o_tp_projectile)
	{
		if o_tp_projectile.can_tp_ == true
		{
			sprite_index = s_reticle_teleport_available;
			image_speed = 1.2;
		} else if o_tp_projectile.can_tp_ == false
		{
			sprite_index = s_reticle;
			image_speed = 0.4;
		}
	} else {
		if sprite_index != s_reticle_attack {
			sprite_index = s_reticle;
			image_speed = 0.4;
		}
	}
}


if (last_sprite != sprite_index) 
{
   image_index = 0;
   last_sprite = sprite_index;
}

