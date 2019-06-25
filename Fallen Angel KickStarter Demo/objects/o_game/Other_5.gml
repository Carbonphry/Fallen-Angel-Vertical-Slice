/// @description Inv update
// You can write your code in this editor
audio_stop_sound(a_portal_ambient);

if !instance_exists(o_player) then exit;

if o_player.sigil_equipped_ {
	global.sigil = true;
}

