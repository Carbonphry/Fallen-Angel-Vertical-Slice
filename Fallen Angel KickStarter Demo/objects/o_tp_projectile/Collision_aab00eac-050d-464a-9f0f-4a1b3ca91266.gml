if z != other.z then exit;

destroy_ = true;
var _enemy_id = other.id;

if hit_sound_ = true
{
	audio_play_sound(a_teleport_hit, 8, false);
	hit_sound_ = false;
}
	
instance_create_layer(_enemy_id.x, _enemy_id.y, "Effects", o_tp_mark);

