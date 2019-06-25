/// @description Insert description here
// You can write your code in this editor
if other.z != z then exit; 

if health_ == 0 then exit;
	
	sprite_index = s_level_garden_artifact_hit;
	invincible_ = true;
	alarm[0] = global.one_second * 0.2;
	health_ -= other.damage_;
	if health_ <= 0 {
		//state_ = 6;	
	} else {
		//state_ = enemy.hit;
		//var _knockback_direction = point_direction(other.x, other.y, x, y);
		//create_animation_effect(s_hit_effect, x, y-8, 1, true);
		//set_movement(_knockback_direction, other.knockback_);
	}
	var a_hit = choose(a_enemy_hit_1, a_enemy_hit_2);  
	add_screenshake(4,20);
	audio_play_sound(a_hit, 7, false);
	global.player_stamina += 0.1;


