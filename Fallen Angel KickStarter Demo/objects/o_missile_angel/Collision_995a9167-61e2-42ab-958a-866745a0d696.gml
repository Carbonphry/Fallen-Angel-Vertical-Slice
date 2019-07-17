if health_ <= 0 exit;
var enemyHeight = 42;
if other.sprite_index != s_player_uppercut_hitbox and !place_meeting(x,y-z,o_trigger_projectile)/*other.sprite_index != s_player_power_burst_projectile*/ {
	if !( (other.z > z-enemyHeight) and (other.z >= z) and (other.z < z+enemyHeight) ) then exit;
}

if z != 0 and !other.lift {
	levitate = true;
	alarm_set(10,global.one_second*.5);
	if instance_exists(o_reticle) {
		o_reticle.stop = true;
	}
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
	alarm_set(8,global.one_second*1);
	if health_ > 0 {
		alarm[0] = global.one_second * 0.2;
	}
	impact_effect_ = choose(s_impact_effect_1,s_impact_effect_2,s_impact_effect_3);
	x_ = (x+ random_range(-12,12));
	y_ = (y-z-15-random_range(-12,12));
	create_animation_effect(impact_effect_, x_, y_, 1, true);
	if health_ <= 0 {
		state_ = missangel.die;
		image_index = 0;
		global.freeze = 1;
	} else {
	if (!uninterruptible) {
		state_ = missangel.hit;
		
		if z == 0 {
			var _knockback_direction = point_direction(other.x, other.y, x, y);
			//set_movement(_knockback_direction, other.knockback_);
			set_move_n(_knockback_direction, other.knockback_*2);
		}
		
	}
	}
	add_screenshake(3,12);
	instance_create_layer(x-irandom_range(10, -10), y-z-irandom_range(25, 0), "Effects", o_blood_burst);
	audio_play_sound(_hit_sound, 8, false);
	if global.player_stamina < global.player_max_stamina {
		global.player_stamina += 0.4;
	}
	
	
	knockback_direction = point_direction(other.x, other.y, x, y);
	knockback_ammount = other.knockback_;
	alarm_set(7,global.one_second*.25);
	
}

/*if other.toground and z !=0  { 
 z -=16;
} *///else if  z != 0 then z+=20;

/*if other.lift and state_ != missangel.die and z == 0 {
	jump = true;
	create_animation_effect(s_projectile_hit, x, y-8, 1, true);
	instance_create_layer(x-irandom_range(20, -20), y-irandom_range(25, 0), "Effects", o_blood_burst);
	instance_create_layer(x-irandom_range(20, -20), y-irandom_range(25, 0), "Effects", o_blood_burst);
	add_screenshake(4,12);
	alarm_set(11,3);
}

