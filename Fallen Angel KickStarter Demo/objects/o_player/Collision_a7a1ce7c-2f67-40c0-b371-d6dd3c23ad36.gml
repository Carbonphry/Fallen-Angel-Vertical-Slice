/// @description Hit logic
if iframe then exit; 
var playerHeight = 28;
if !( (other.z >= z) and (other.z < z+playerHeight) ) then exit;
if state_ == player.smash then exit;
if ( state_ == player.dead ) then exit;

if hurtbox_entity_can_be_hit_by(other)
{
	invincible_ = true;
	alarm[0] = global.one_second * 0.5;
	global.player_health -= other.damage_;
	global.auto_jump_ = false;
	var _direction = point_direction(other.x, other.y, x, y);
	set_movement(_direction, other.knockback_);
	//set_move_n(_direction, other.knockback_*2);
	//If knockback
	switch other.stun {
		
		case true:
		state_ = player.hit_knockback;
		add_screenshake(8,16);
		break;
		
		case false:
		state_ = player.hit;
		add_screenshake(4,8);
		break;
	}
	instance_create_layer(x-5, y-10, "Effects", o_blood_burst_player);
	instance_create_layer(x+5, y-20, "Effects", o_blood_burst_player);
	if !global.coop {
		set_vibration(.7, .7 ,.2);
	}
	audio_play_sound(a_hurt, 6, false);
	o_pride_meter.ego_add += PTS_HIT;
}

