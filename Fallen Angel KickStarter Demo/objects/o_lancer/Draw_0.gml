/// @description Insert description here
// You can write your code in this editor

//Execution
if state_ == lancer.stun { 
	
	var targ = instance_nearest(x,y,class_player);
	if targ.z == targ.z_ground {
	if point_distance(x,y,targ.x,targ.y) < 20 {
	
		if o_input.action_one_ {
			stp+=0.32;
			o_player.cannot_move = true;
		} else {
			stp = 0;
			o_player.cannot_move = false;
		}
	
		if stp > 12 {
			targ.state_ = player.execute;
			state_ = lancer.executed;
			o_player.cannot_move = false;
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
}

draw_sprite(s_medium_shadow, 0, x, y+6);
//draw_self();
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if state_ != lancer.block {
	draw_self_flash(c_red, 6, alarm[0]);
}

/*
if alarm_get(9) < global.one_second*.42 {
	if class_player.power_stance == true then draw_sprite(s_pulse_effect,pulseanim,x,y-z-thr);
	if pulseanim > 3 {
		pulseanim = 0;
		alarm_set(9,global.one_second*1.5);
	}
	pulseanim +=0.1;
}*/

if alarm_get(8) > 0 and health_ > 0 {
	//var life_size = max(health_/max_health_,0);
	//draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	draw_sprite_ext(s_hp_bar_8, 0, x-13,y-sprite_height/2-z, 1, 1, 0, c_white, 1);
	if health_ > 0 {
		draw_sprite(s_8_hp,health_,x-13,y-sprite_height/2-z);
	} 
}
///Run shader
/*
//Wave back and forth between 1 and 0 for the demo
DissolveAmount = 1 + ((0 - 1) * 0.5) + sin((((current_time * 0.001) + 8 * 0) / 8) * (pi*2)) * ((0 - 1) * 0.5); 

//Draw the sprite using the shader, that's it!
DissolveShader(sprite_index,image_index,x,y,DissolveAmount);

