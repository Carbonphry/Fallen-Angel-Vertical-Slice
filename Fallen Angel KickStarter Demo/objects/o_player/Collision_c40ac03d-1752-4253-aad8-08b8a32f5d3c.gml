/// @description Flash Parry
// You can write your code in this editor
if state_ != player.evade then exit;
if sprite_index == sprite_[player.dash_parry, direction_facing_] then exit;
if !parry then exit;
if !other.parriable then exit;

image_index = old_image_index;
sprite_index = sprite_[player.dash_parry, direction_facing_]; 
depth -=30;
parry = false;
global.freeze = 1;
o_pride_meter.ego_add += PTS_PARRY;
with other {
	health_ -= 1;
	if health_ > 0  {
		state_ = lancer.stun;
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
}

//add_movement_maxspeed(point_direction(other.x,other.y,x,y), acceleration_, max__speed_);
//motion_add(point_direction(other.x,other.y,x,y),0.5);
/*if (state_ != player.sword or  state_ != player.sword2 or state_ != player.sword3 or state_ != player.evade ) and alarm[6] <= 0 {
	var _direction = point_direction(other.x, other.y, x, y);
	set_movement(_direction,1.5);
	//state_ = player.enemy_coll;
	alarm[6] = global.one_second*.3;
}