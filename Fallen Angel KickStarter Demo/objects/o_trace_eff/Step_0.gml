/// @description Insert description here
// You can write your code in this editor
if fad == true {
	image_alpha -= .1;
	if image_alpha <= 0 {
		instance_destroy();
	}
}

if instance_exists(o_player) {
	image_xscale = o_player.image_xscale;
}