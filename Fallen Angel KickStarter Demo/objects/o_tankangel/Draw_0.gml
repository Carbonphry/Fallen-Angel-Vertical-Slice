/// @description Shadow on Jump

//Execution
if state_ == tankangel.stun { 
	
	var targ = instance_nearest(x,y,class_player);
	if point_distance(x,y,targ.x,targ.y) < 20 {
	
		if o_input.action_one_ {
			stp+=0.25;
		} else {
			stp = 0;
		}
	
		if stp > 12 {
			targ.state_ = player.execute;
			state_ = tankangel.executed;
			if targ.x <= x {
				targ.image_xscale = 1;
			} else {
				targ.image_xscale = -1;
			}
		}
	
		draw_sprite(s_hold_x,stp,x,y+20);
	} else {
		stp = 0;
	}

} else {
		stp = 0;
}

if onAir {
	var t = (current_time-T_)/1000;
	//show_debug_message(string(t));
	t = min(t,1);
	var sh_x = lerp(originX, targetX,t);
	var sh_y  = lerp(originY, targetY,t);
	var distanceRemaining = point_distance(x,y,targetX,targetY);
	draw_sprite(s_large_shadow1,0,sh_x, sh_y);
	draw_self();
} else {
	draw_sprite(s_large_shadow1, 0, x, y);
	draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}

draw_self_flash(c_red, 6, alarm[0]);

/*
if alarm_get(9) < global.one_second*.42 {
	if class_player.power_stance == true then draw_sprite(s_pulse_effect,pulseanim,x,y-thr);
	if pulseanim > 3 {
		pulseanim = 0;
		alarm_set(9,global.one_second*1.5);
	}
	pulseanim +=0.1;
}*/

if alarm_get(8) > 0 and state_ != tankangel.jump {
	//var life_size = max(health_/max_health_,0);
	//draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	draw_sprite(s_hp_bar_16,0,x-28,y-sprite_height/1.2+15-z);
	if health_ > 0 {
		draw_sprite(s_hp,health_,x-24,y-sprite_height/2-z-5);
	} else {
		draw_sprite(s_hp,0,x-24,y-sprite_height/2-z-5);
	}
	//draw_sprite_ext(s_enemy_bar_life, 0, x-10,y-sprite_height/1.2, life_size, 1, 0, c_white, 1);
}
//Debug State
//draw_text(x,y,string(state_));