//if state_ == tankangel.jump then exit;
if health_ <= 0 exit;
var enemyHeight = 42;
if !( (other.z > z-enemyHeight) and (other.z >= z) and (other.z < z+enemyHeight) ) then exit;

if other.lift {
	//jump = true;
	create_animation_effect(s_projectile_hit, x, y-8, 1, true);
	instance_create_layer(x-irandom_range(20, -20), y-irandom_range(25, 0), "Effects", o_blood_burst);
	add_screenshake(4,12);
	var target = instance_nearest(x,y,class_player);
	heavyknockdir =  point_direction(target.x, target.y, x, y);
	global.freeze = 1;
	//state_ = tankangel.jump_atk;
	//alarm_set(11,3);
}



var _hit_sound = choose(a_enemy_hit_1, a_enemy_hit_2);
if hurtbox_entity_can_be_hit_by(other)
{
	invincible_ = true;
	if pulseanim > 0 {
		health_ -= other.damage_*2;
	} else {
		health_ -= other.damage_;
	}
	alarm_set(8,global.one_second*.7);
	if health_ > 0 {
		alarm[0] = global.one_second * 0.2;
	}
	impact_effect_ = choose(s_impact_effect_1,s_impact_effect_2,s_impact_effect_3);
	x_ = (x+ random_range(-12,12));
	y_ = (y+ random_range(-12,12));
	create_animation_effect(impact_effect_, x_, y_-14, 1, true);
	if health_ <= 0 {
		image_index = 0;
		state_ = tankangel.die;	
		global.freeze = 1;
	} else {
	if (!uninterruptible and !other.lift and !other.stun) {
		state_ = tankangel.hit;
		
		if z == 0 {
			var _knockback_direction = point_direction(other.x, other.y, x, y);
			//set_movement(_knockback_direction, other.knockback_);
			set_move_n(_knockback_direction, other.knockback_*2);
		}
		
	} else if other.stun {
		
		switch state_ {
		
			case tankangel.attack:
			if image_index >= 6 and image_index <= 10 {
				o_pride_meter.ego_add += PTS_PARRY;
				state_ = tankangel.stun;
				if !audio_is_playing(a_player_parried) {
					audio_play(a_player_parried);
				}
			}
			break;
		
			case tankangel.jump:
			if image_index >= 2 and image_index <= 5 {
				o_pride_meter.ego_add += PTS_PARRY;
				state_ = tankangel.stun;
				if !audio_is_playing(a_player_parried) {
					audio_play(a_player_parried);
				}
			}
			break;
		}
		global.freeze = 1;	
	}
	}
	add_screenshake(3,12);
	instance_create_layer(x-irandom_range(10, -10), y-irandom_range(25, 0), "Effects", o_blood_burst);
	audio_play_sound(_hit_sound, 8, false);
	if global.player_stamina < global.player_max_stamina {
		global.player_stamina += 0.4;
	}
}

/*if other.toground  { 
 z -=16;
} else if  z != 0 then z+=20;*/

if other.lift and state_ != tankangel.die and z == 0 {
	jump = true;
	create_animation_effect(s_projectile_hit, x, y-8, 1, true);
	instance_create_layer(x-irandom_range(20, -20), y-irandom_range(25, 0), "Effects", o_blood_burst);
	instance_create_layer(x-irandom_range(20, -20), y-irandom_range(25, 0), "Effects", o_blood_burst);
	add_screenshake(4,12);
	alarm_set(11,3);
	audio_play(a_enemy_lifted);
}