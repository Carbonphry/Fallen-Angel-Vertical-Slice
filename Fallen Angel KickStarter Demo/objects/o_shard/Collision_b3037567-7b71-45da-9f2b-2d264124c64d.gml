/// @description Add to inv
// You can write your code in this editor
if global.ammo_count < 3 {
	 global.ammo_count++;
}
audio_play(a_collect_item);
instance_destroy(id,true);