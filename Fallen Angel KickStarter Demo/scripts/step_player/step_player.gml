///@param Inpu

if state_ != player.evade {
	visible = true;
	evade_step = true;
}

if state_ != player.ram {
	ramState = noone;
}

if z == z_ground and last_z > z_ground and state_ != player.smash and !place_meeting(x,y,o_solid_air) {
	state_ = player.land;
	last_z = z_ground;
}

if z == z_ground {
	if instance_exists(o_black_wings) {
		instance_destroy(o_black_wings,true);
	}
	//Ledge
	direction_facing_before_jump = direction_facing_;
	
	//Charge Attack
	if state_ == player.move or state_ == player.idle {
		if o_input.action_one_ {
			if o_input.alarm[3] == -1 {
				o_input.alarm[3] = global.one_second*.5;
			
			}
			if o_input.alarm[3] == 1 {
				o_player.state_ = player.charge_attack;
				if !audio_is_playing(a_player_chargeattack_start) {
					audio_play(a_player_chargeattack_start);
				}
				charge_state = 0;
				if power_stance {
					sprite_[player.charge_attack, dir.right] = s_player_power_chargeattack_start;
					sprite_[player.charge_attack, dir.up] = s_player_power_chargeattack_start_up;
					sprite_[player.charge_attack, dir.left] = s_player_power_chargeattack_start;
					sprite_[player.charge_attack, dir.down] = s_player_power_chargeattack_start;
				} else {
					sprite_[player.charge_attack, dir.right] = s_player_chargeattack_start;
					sprite_[player.charge_attack, dir.up] = s_player_chargeattack_start_up;
					sprite_[player.charge_attack, dir.left] = s_player_chargeattack_start;
					sprite_[player.charge_attack, dir.down] = s_player_chargeattack_start;
				}
				
				
			}
		} else {
			o_input.alarm[3] = -1;
		}
	}
} 

if z > z_ground and !gliding {

with instance_create_depth(x,y-z,depth+1,o_jump_mb) {
	sprite_index = other.sprite_index;
	image_index = other.image_index;
	image_xscale = other.image_xscale;
}

switch power_stance {

case false:
sprite_[player.smash, dir.right] = s_player_startspin;
sprite_[player.smash, dir.up] = s_player_startspin;
sprite_[player.smash, dir.left] = s_player_startspin;
sprite_[player.smash, dir.down] = s_player_startspin;

sprite_[player.land, dir.right] = s_player_jump_land_right;
sprite_[player.land, dir.up] = s_player_jump_land_up;
sprite_[player.land, dir.left] =  s_player_jump_land_right;
sprite_[player.land, dir.down] = s_player_jump_land_down;


break;

case true:
sprite_[player.smash, dir.right] = s_player_power_smash_startspin;
sprite_[player.smash, dir.up] = s_player_power_smash_startspin;
sprite_[player.smash, dir.left] = s_player_power_smash_startspin;
sprite_[player.smash, dir.down] = s_player_power_smash_startspin;

sprite_[player.land, dir.right] = s_player_power_jump_land_right;
sprite_[player.land, dir.up] = s_player_power_jump_land_up;
sprite_[player.land, dir.left] = s_player_power_jump_land_right;
sprite_[player.land, dir.down] = s_player_power_jump_land_down;



/*sprite_[player.hit, dir.right] = s_player_power_;
sprite_[player.hit, dir.up] = s_player_damaged_up;
sprite_[player.hit, dir.left] = s_player_damaged_right;
sprite_[player.hit, dir.down] = s_player_damaged_down;*/
break;


}

if place_meeting(x,y-z,ledge_up) and direction_facing_before_jump == dir.up and alarm_get(6)<=0 and state_ != player.ledge {
		var led_ = instance_nearest(x,y-z,ledge_up);
		if /*led_.fake_z != fake_z and*/ led_.depth_ > y { 
			state_ = player.ledge;
			led_dir = dir.up;
			y = led_.y_;
			z = z_ground;
		}
} else if place_meeting(x,y-z,ledge_down) and direction_facing_before_jump == dir.down and alarm_get(6)<=0 and state_ != player.ledge  {
		var led_ = instance_nearest(x,y-z,ledge_down);
		if /*led_.fake_z != fake_z and*/ led_.depth_ > y { 
			state_ = player.ledge;
			led_dir = dir.down;
			y = led_.y_;
			z = z_ground;
		}
} else if place_meeting(x,y-z,ledge_right) and direction_facing_before_jump == dir.right and alarm_get(6)<=0 and state_ != player.ledge {
		var led_ = instance_nearest(x,y-z,ledge_right);
		//if /*led_.fake_z != fake_z and led_.depth_ > y */ { 
			state_ = player.ledge;
			led_dir = dir.right;
			x = led_.x_;
			z = z_ground;
		//}
} else if place_meeting(x,y-z,ledge_left) and direction_facing_before_jump == dir.left and alarm_get(6)<=0 and state_ != player.ledge {
		var led_ = instance_nearest(x,y-z,ledge_left);
		if /*led_.fake_z != fake_z and */led_.depth_ > y  { 
			state_ = player.ledge;
			led_dir = dir.left;
			x = led_.x_;
			z = z_ground;
		}
}

} 

if power_stance {

	sprite_[player.idle, dir.right] = s_player_power_idle;
	sprite_[player.idle, dir.up] = s_player_power_idle_up;
	sprite_[player.idle, dir.left] = s_player_power_idle;
	sprite_[player.idle, dir.down] = s_player_power_idle;

	sprite_[player.move, dir.right] = s_player_power_move_right;
	sprite_[player.move, dir.up] = s_player_power_move_up;
	sprite_[player.move, dir.left] = s_player_power_move_right;
	sprite_[player.move, dir.down] = s_player_power_move_down;

	sprite_[player.run_start, dir.right] = s_player_power_move_right_start;
	sprite_[player.run_start, dir.up] =  s_player_power_move_up_start;
	sprite_[player.run_start, dir.left] = s_player_power_move_right_start;
	sprite_[player.run_start, dir.down] = s_player_power_move_down_start;

	sprite_[player.run_stop, dir.right] = s_player_power_move_right_stop;
	sprite_[player.run_stop, dir.up] =  s_player_power_move_up_stop;
	sprite_[player.run_stop, dir.left] = s_player_power_move_right_stop;
	sprite_[player.run_stop, dir.down] = s_player_power_move_down_stop;
	
	sprite_[player.jump, dir.right] = s_player_power_jump_right;
	sprite_[player.jump, dir.up] = s_player_power_jump_up;
	sprite_[player.jump, dir.left] = s_player_power_jump_right;
	sprite_[player.jump, dir.down] = s_player_power_jump_down;

	sprite_[player.fall, dir.right] = s_player_power_fall_right;
	sprite_[player.fall, dir.up] = s_player_power_fall_up;
	sprite_[player.fall, dir.left] = s_player_power_fall_right;
	sprite_[player.fall, dir.down] = s_player_power_fall_down;

	sprite_[player.falling, dir.right] = s_player_power_fall_right;
	sprite_[player.falling, dir.up] = s_player_power_fall_up;
	sprite_[player.falling, dir.left] = s_player_power_fall_right;
	sprite_[player.falling, dir.down] = s_player_power_fall_down;
	
	sprite_[player.land, dir.right] = s_player_power_jump_land_right;
	sprite_[player.land, dir.up] = s_player_power_jump_land_up;
	sprite_[player.land, dir.left] =  s_player_power_jump_land_right;
	sprite_[player.land, dir.down] = s_player_power_jump_land_down;
	
	sprite_[player.hit, dir.right] = s_player_power_damaged_right;
	sprite_[player.hit, dir.up] = s_player_power_damaged_up;
	sprite_[player.hit, dir.left] =  s_player_power_damaged_right;
	sprite_[player.hit, dir.down] = s_player_power_damaged_down;
	
	sprite_[player.hit_knockback, dir.right] = s_player_power_knockback;
	sprite_[player.hit_knockback, dir.up] = s_player_power_knockback;
	sprite_[player.hit_knockback, dir.left] =  s_player_power_knockback;
	sprite_[player.hit_knockback, dir.down] = s_player_power_knockback;
	
	sprite_[player.glide, dir.right] = s_player_power_glide_right;
	sprite_[player.glide, dir.up] = s_player_power_glide_up;
	sprite_[player.glide, dir.left] =  s_player_power_glide_right;
	sprite_[player.glide, dir.down] = s_player_power_glide_down;
	
	sprite_[player.heal, dir.right] = s_player_power_heal;
	sprite_[player.heal, dir.up] = s_player_power_heal;
	sprite_[player.heal, dir.left] =  s_player_power_heal;
	sprite_[player.heal, dir.down] = s_player_power_heal;
	
} else {
	
	sprite_[player.idle, dir.right] = s_player_idle;
	sprite_[player.idle, dir.up] = s_player_idle_up;
	sprite_[player.idle, dir.left] = s_player_idle;
	sprite_[player.idle, dir.down] = s_player_idle;

	sprite_[player.move, dir.right] = s_player_run_right;
	sprite_[player.move, dir.up] = s_player_run_up;
	sprite_[player.move, dir.left] = s_player_run_right;
	sprite_[player.move, dir.down] = s_player_run_down;

	sprite_[player.run_start, dir.right] = s_player_run_right_start;
	sprite_[player.run_start, dir.up] =  s_player_run_up_start;
	sprite_[player.run_start, dir.left] = s_player_run_right_start;
	sprite_[player.run_start, dir.down] = s_player_run_down_start;

	sprite_[player.run_stop, dir.right] = s_player_run_right_stop;
	sprite_[player.run_stop, dir.up] =  s_player_run_up_stop;
	sprite_[player.run_stop, dir.left] = s_player_run_right_stop;
	sprite_[player.run_stop, dir.down] = s_player_run_down_stop;
	
	sprite_[player.jump, dir.right] = s_player_jump_right;
	sprite_[player.jump, dir.up] = s_player_jump_up;
	sprite_[player.jump, dir.left] = s_player_jump_right;
	sprite_[player.jump, dir.down] = s_player_jump_down;

	sprite_[player.fall, dir.right] = s_player_fall_right;
	sprite_[player.fall, dir.up] = s_player_fall_up;
	sprite_[player.fall, dir.left] = s_player_fall_right;
	sprite_[player.fall, dir.down] = s_player_fall_down;

	sprite_[player.falling, dir.right] = s_player_fall_right;
	sprite_[player.falling, dir.up] = s_player_fall_up;
	sprite_[player.falling, dir.left] = s_player_fall_right;
	sprite_[player.falling, dir.down] = s_player_fall_down;
	
	sprite_[player.land, dir.right] = s_player_jump_land_right;
	sprite_[player.land, dir.up] = s_player_jump_land_up;
	sprite_[player.land, dir.left] =  s_player_jump_land_right;
	sprite_[player.land, dir.down] = s_player_jump_land_down;
	
	sprite_[player.hit_knockback, dir.right] = s_player_damaged_knockback;
	sprite_[player.hit_knockback, dir.up] = s_player_damaged_knockback;
	sprite_[player.hit_knockback, dir.left] = s_player_damaged_knockback;
	sprite_[player.hit_knockback, dir.down] = s_player_damaged_knockback;

	sprite_[player.hit, dir.right] = s_player_damaged_right;
	sprite_[player.hit, dir.up] = s_player_damaged_up;
	sprite_[player.hit, dir.left] = s_player_damaged_right;
	sprite_[player.hit, dir.down] = s_player_damaged_down;
	
	sprite_[player.glide, dir.right] = s_player_glide_right__;
	sprite_[player.glide, dir.up] = s_player_glide_up;
	sprite_[player.glide, dir.left] =  s_player_glide_right__;
	sprite_[player.glide, dir.down] = s_player_glide_down__;
	
	sprite_[player.heal, dir.right] = s_player_heal;
	sprite_[player.heal, dir.up] = s_player_heal;
	sprite_[player.heal, dir.left] =  s_player_heal;
	sprite_[player.heal, dir.down] = s_player_heal;
}

var offset = sprite_height-sprite_yoffset;
if state_ == player.dead {
	depth = -9999;
} else {
	/*if room == r_intro_room1 { 
		depth = 950;
	} else {
		depth = -y - z;
	}*/
	depth = -y - z;
}

if place_meeting(x,y,o_stair_slow) and !gliding and alarm_get(6) <=0 {
	player_spd = 2;
} else {
	player_spd = 3;
}

//event_user(state_);

switch state_ {

	case player.move:
	state_move();
	break;
	
	case player.sword:
	state_swing();
	break;
	
	case player.sword2:
	state_swing();
	break;
	
	case player.sword3:
	state_swing();
	break;
	
	case player.evade:
	state_evade();
	break;
	
	case player.idle:
	state_idle();
	break;
	
	case player.heavy_attack:
	state_heavy_attack();
	break;
	
	case player.heal:
	state_heal();
	break;
	
	case player.falling:
	state_falling();
	break;
	
	case player.hit:
	state_hit();
	break;
	
	case player.hit_knockback:
	state_hit_knockback();
	break;

	case player.land:
	image_speed = .9;
	break;

	case player.dead:
	state_dead();
	break;

	case player.not_playable:
	state_not_playable();
	break;
	
	case player.smash:
	state_smash();
	break;
	
	case player.parry:
	state_parry();
	break;
	
	case player.transition:
	state_transition();
	break;
	
	case player.intro:
	state_intro();
	break;
	
	case player.ledge:
	state_ledge();
	break;
	
	case player.stanceSwitch:
	state_stanceSwitch();
	break;
	
	case player.ram:
	state_ram();
	break;

	case player.failHit:
	state_failHit();
	break;
	
	case player.charge_attack:
	state_charge_attack();
	break;
	
	case player.execute:
	state_execute();
	break;
}

if state_ != player.move and state_ != player.ledge and state_ != player.stanceSwitch /* or state_ != player.idle*/ { 
	if state_ != player.idle and state_ != player.ram {
		sprite_index = sprite_[state_, direction_facing_];
		//anim_run_stop = true;
		anim_run_stop = false;
	}
	anim_run_start = true;
} 

//Stance
var stance_stamina_cost_ = 0.00;
if instance_exists(o_pride_meter) and state_ != player.stanceSwitch {
	if o_pride_meter.state == 1 and alarm_get(9)<=0 and !power_stance  {
		power_stance = true;
		image_index = 0;
		state_ = player.stanceSwitch;
	
	} else if power_stance and o_pride_meter.state == 0 { 
		power_stance = false;
		image_index = 0;
		state_ = player.stanceSwitch;
	}
}

/*if power_stance {
	
	if global.player_stamina > 0 {
		var stance_stamina_cost_ = 0.02;
		global.player_stamina -= stance_stamina_cost_;
	} else {
		power_stance = false;	
		image_index = 0;
		state_ = player.stanceSwitch;
	}
	add_screenshake(0.5,20);
	if !audio_is_playing(a_power_stance) {
		audio_play(a_power_stance);
	}
	//part_system_depth(part_system_stance, o_player.depth);
	/*part_emitter_region(part_system_stance, part_emitter_, id.x-10, id.x+10, id.y-id.z-30, id.y-id.z+6,ps_shape_diamond, ps_distr_linear);
	part_emitter_burst(part_system_stance, part_emitter_, part_type_, 4);*/
/*
}*/


///Health Stack System
if (global.player_health < global.player_max_health) and global.player_health > 0 {
	
	if (global.player_health < 6) and (global.player_health > 4)  {
		global.player_health += 0.001;
	}
	
	if (global.player_health < 4) and (global.player_health > 2)  {
		global.player_health += 0.001;
	}
	
	if (global.player_health < 2) and (global.player_health > 0)  {
		global.player_health += 0.001;
	}
	
} 

if (last_sprite != sprite_index and state_ != player.ram){
   image_index = 0;
   last_sprite = sprite_index;
}

//Smash Check
if z != z_ground and z-z_ground >= 13 and state_ != player.smash {

	if argument0.action_one_ {
		step +=1;
	} else {
		step = 0;
	}
	
	var costSmash = 0;
	if global.player_stamina >= evade_stamina_cost_ {
		if step >= global.one_second*.2 and global.player_stamina >= costSmash {
			step = 0;
			global.player_stamina -= costSmash;
			state_ = player.smash;
			audio_play(a_player_attack_smash);
		}
	} else {
		if instance_exists(o_hud) {
			o_hud.alarm[3] = global.one_second*.5;
			o_hud.show_stamina = true;
		}
	}
}	