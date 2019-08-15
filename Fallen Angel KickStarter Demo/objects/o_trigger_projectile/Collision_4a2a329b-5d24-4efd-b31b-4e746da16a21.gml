/// @description Insert description here
// You can write your code in this editor

impact_ = true;
if sprite_index == s_player_burst_projectile or sprite_index == s_player_power_burst_projectile {
	alarm_set(2,1);
}

if !other.parriable then exit;

if other.alarm[6] > global.one_second*.1 then exit;

global.freeze = 1;
o_pride_meter.ego_add += PTS_PARRY;
with other {
	health_ -= other.damage_;
	if health_ > 0  {
		//state_ = lancer.stun;
		state_ = lancer.hit;
	} else {
		state_ = lancer.die;
	}
	impact_effect_ = choose(s_impact_effect_1,s_impact_effect_2,s_impact_effect_3);
	x_ = (x+ random_range(-12,12));
	y_ = (y-z-15-random_range(-12,12));
	create_animation_effect(impact_effect_, x_, y_, 1, true);
	add_screenshake(3,12);
	instance_create_layer(x-irandom_range(10, -10), y-z-irandom_range(25, 0), "Effects", o_blood_burst);
	var _hit_sound = choose(a_enemy_hit_1, a_enemy_hit_2);
	audio_play_sound(_hit_sound, 8, false);
	if global.player_stamina < global.player_max_stamina {
		global.player_stamina += 0.4;
	}
	alarm_set(8,global.one_second*1);
	set_vibration(.9,.9,.1);
	with instance_create_depth(x,y,depth, o_shard) {
		//direction = point_direction(x,y,class_player.x,class_player.y);
		range = 400;
	}
	alarm_set(6,global.one_second*.2);
}