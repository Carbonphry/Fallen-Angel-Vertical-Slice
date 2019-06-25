if health_ <= 0 exit;

var enemyHeight = 70;
if !( (other.z > z-enemyHeight) and (other.z >= z) and (other.z < z+enemyHeight) ) then exit;

var _hit_sound = choose(a_enemy_hit_1, a_enemy_hit_2);
if hurtbox_entity_can_be_hit_by(other)
{
	invincible_ = true;
	alarm[0] = global.one_second * 0.2;
	health_ -= other.damage_;
	impact_effect_ = choose(s_impact_effect_1,s_impact_effect_2,s_impact_effect_3);
	x_ = (x+ random_range(-20,20));
	y_ = (y+ random_range(-20,20));
	create_animation_effect(impact_effect_, x_, y_-14, 1, true);
	/*if (!uninterruptible) {
		state_ = lancer.hit;
		var _knockback_direction = point_direction(other.x, other.y, x, y);
		set_movement(_knockback_direction, other.knockback_);
		add_screenshake(3,12);
		instance_create_layer(x-irandom_range(10, -10), y-irandom_range(25, 0), "Effects", o_blood_burst);
	}*/
	audio_play_sound(_hit_sound, 8, false);
	add_screenshake(4,10);
	if global.player_stamina < global.player_max_stamina {
		global.player_stamina += 0.4;
	}
	
	if other.stun {
		
		switch state_ {
		
			case abdiel.attack:
			if image_index >= 0 and image_index <= 4 {
				state_ = abdiel.stun;
				if !audio_is_playing(a_player_parried) {
					audio_play(a_player_parried);
				}
				
			}
			break;
		
			case abdiel.projectile:
			if image_index >= 0 and image_index <= 4 {
				state_ = abdiel.stun;
				if !audio_is_playing(a_player_parried) {
					audio_play(a_player_parried);
				}
				
			}
			break;
			
			case abdiel.warp:
			if image_index >= 0 and image_index <= 6 {
				state_ = abdiel.stun;
				if !audio_is_playing(a_player_parried) {
					audio_play(a_player_parried);
				}
				
			}
			break;
			
		}
	}
	
	if health_ <= 0 {
		DissolveAmount = 0.01;
	}
	if health_ <= 1 and state_ != enemy.hit and state_ != abdiel.die {
		image_index = 0;
		state_ = abdiel.die;
	}

	
}

if other.sprite_index == s_player_uppercut_hitbox and state_ != abdiel.die {
	
	stun_knockback_direction = point_direction(other.x, other.y, x, y);
	image_index = 0;
	state_ = abdiel.stun;
	global.freeze = 1;
}
