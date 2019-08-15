/// @description Insert description here
// You can write your code in this editor
event_inherited(); 
//Execution
if state_ == flameangel.stun { 
	
	var targ = instance_nearest(x,y,class_player);
	if targ.z == targ.z_ground {
	if point_distance(x,y,targ.x,targ.y) < 20 {
	
		if o_input.action_one_ {
			stp+=0.4;
			o_player.cannot_move = true;
		} else {
			stp = 0;
			o_player.cannot_move = false;
		}
	
		if stp > 12 {
			targ.state_ = player.execute;
			state_ = flameangel.executed;
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

} else {
		stp = 0;
}

if alarm_get(8) > 0 and health_ > 0 {
	//var life_size = max(health_/max_health_,0);
	//draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	
	draw_sprite_ext(s_hp_bar_8, 0, x-13,y-sprite_height/2-z, 1, 1, 0, c_white, 1);
	if health_ > 0 {
		draw_sprite(s_8_hp,health_,x-13,y-sprite_height/2-z);
	} 
}

var _glow = 0.4;
var _x_pos = x;
var _y_pos = y -11;

gpu_set_blendmode(bm_add);
draw_sprite_ext(s_warm_glow,0,_x_pos,_y_pos-z,0.15,0.15,0,c_orange,_glow);
gpu_set_blendmode(bm_normal);

