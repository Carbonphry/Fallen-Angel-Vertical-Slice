/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_abdiel) then exit;
if o_abdiel.state_ == abdiel.die then exit;
var boss_room_x1 = 300;
var boss_room_x2 = 670;
var boss_room_y1 = 456;
var boss_room_y2 = 616;
var xp = irandom_range(boss_room_x1, boss_room_x2);
var yp = irandom_range( boss_room_y1, boss_room_y2);
{
	do {
		var xp = irandom_range(boss_room_x1, boss_room_x2);
		var yp = irandom_range( boss_room_y1, boss_room_y2);
	} until !((xp >= 445 and xp <= 565) and (yp >= 482 and yp <= 586))
}



with instance_create_depth(xp,yp,-y,o_enemy_portal_abdiel_fight) {
	enemy_ = choose(o_cherub,o_flameangel,o_flameangel,o_lancer,o_tankangel);
}
//alarm_set(0,global.one_second*10);