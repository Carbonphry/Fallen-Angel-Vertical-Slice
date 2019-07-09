if health_ <= 0 exit;
var enemyHeight = 42;
if !( (other.z > z-enemyHeight) and (other.z >= z) and (other.z < z+enemyHeight) ) then exit;

if z != 0 and !other.lift {
	levitate = true;
	alarm_set(10,global.one_second*.5);
	o_reticle.stop = true;
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
	y_ = (y-z+ random_range(-12,12));
	create_animation_effect(impact_effect_, x_, y_-14, 1, true);
	if health_ <= 0 {
		state_ = flameangel.die;
		image_index = 0;
		global.freeze = 1;
	} else {
	if (!uninterruptible and !other.stun and state_ != flameangel.stun ) {
		state_ = flameangel.hit;
		alarm[4] = global.one_second*.25;
		if z == 0 {
			knockback_direction = point_direction(other.x, other.y, x, y);
			knockback_ammount = other.knockback_;
		}
		
	} else if other.stun {
		
		switch state_ {
		
			case flameangel.explosion:
			if image_index >= 2 and image_index <= 9 {
				o_pride_meter.ego_add += PTS_PARRY;
				state_ = flameangel.stun;
				if !audio_is_playing(a_player_parried) {
					audio_play(a_player_parried);
				}
			}
			break;
		
			case flameangel.attack:
			if image_index >= 0 and image_index <= 6 {
				o_pride_meter.ego_add += PTS_PARRY;
				state_ = flameangel.stun;
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
	if bleed_ = true
	{
		instance_create_layer(x-irandom_range(10, -10), y-z-irandom_range(25, 0), "Effects", o_blood_burst);
	}
	audio_play_sound(_hit_sound, 8, false);
	if global.player_stamina < global.player_max_stamina {
		global.player_stamina += 0.4;
	}
}

if other.toground {
	if z >=8  { 
		z -=8;
	} else {
		z =0;
	}
}//else if  z != 0 then z+=20;

if other.lift and state_ != flameangel.die and z == 0 {
	jump = true;
	create_animation_effect(s_projectile_hit, x, y-8, 1, true);
	//instance_create_layer(x-irandom_range(20, -20), y-z-irandom_range(25, 0), "Effects", o_blood_burst);
	//instance_create_layer(x-irandom_range(20, -20), y-z-irandom_range(25, 0), "Effects", o_blood_burst);
	bleed_ = false;
	add_screenshake(4,12);
	alarm_set(11,3);
	global.freeze = 1;
}

