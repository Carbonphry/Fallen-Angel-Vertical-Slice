gml_pragma("forceinline");
var _life =  global.one_second*3.5;
var _damage = DMG_TRIGGER_PROJECTILE*8;
var _knockback = 1;
var radious = 5;

switch direction_facing_ {
		
	case dir.right:
	var projectileX = x+5+(lengthdir_x(radious,mouseDir));
	var projectileY = y-19+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x+5,y-19,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	break;
	
	case dir.left:
	var projectileX = x-3+(lengthdir_x(radious,mouseDir));
	var projectileY = y-19+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x-3,y-19,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	break;
	
	case dir.up:

	var projectileX = x-1+(lengthdir_x(radious,mouseDir));
	var projectileY = y-17+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x-1,y-17,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	break;
	
	case dir.down:
	var projectileX = x-2+(lengthdir_x(radious,mouseDir));
	var projectileY = y-21+(lengthdir_y(radious,mouseDir));
	with instance_create_depth(x-2,y-21,other.depth-1,o_animation_effect) {
		sprite_index = s_player_burst_fire_effect;
		image_angle = other.mouseDir;
		image_speed = 2.5;
	}
	break;
}

create_hitbox_trigger_precise(projectileX, projectileY, mouseDir,_life, [o_enemy, o_grass, o_bush], _damage, _knockback);