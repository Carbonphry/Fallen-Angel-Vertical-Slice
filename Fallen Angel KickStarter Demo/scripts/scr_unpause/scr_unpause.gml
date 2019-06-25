gml_pragma("forceinline");

paused_ = false;
if sprite_exists(paused_sprite_)
{
	sprite_delete(paused_sprite_)
	window_set_cursor(cr_none);
}
instance_activate_all();


if instance_exists(block_fight) and !instance_exists(o_abdiel) {
	instance_deactivate_object(block_fight);
} 
if !instance_exists(o_abdiel) {
	instance_deactivate_object(camera_boss);
}
audio_play(a_unpause);

window_set_cursor(cr_none);