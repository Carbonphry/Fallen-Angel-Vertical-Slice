/// @description Insert description here
// You can write your code in this editor
if instance_exists(o_abdiel) and !instance_exists(o_text) and alarm_get(0) <=0 {
	if o_abdiel.state_ != abdiel.die {
		alarm_set(0,global.one_second*15);
	}
}