/// @description Insert description here
// You can write your code in this editor
if sprite_exists(paused_sprite) { 
	draw_sprite_ext(paused_sprite, 0, 0, 0,0.25, 0.25, 0 , c_white, 1);
	
	if o_input.left_pressed_ {
		selection = true;
	} else if o_input.right_pressed_ {
		selection = false;
	}
	
	switch selection {
	
		case false:
		draw_sprite_ext(s_upgrade_slashdash,        0, 40, 180,.25, .25, 0 , c_white, 1);
		
		draw_sprite_ext(s_upgrade_tripleprojectile, 0, 300, 180,.3, .3, 0 , c_white, 1);
		break;
		
		case true:
		draw_sprite_ext(s_upgrade_slashdash,        0, 40, 180,.3, .3, 0 , c_white, 1);
		draw_sprite_ext(s_upgrade_tripleprojectile, 0, 300, 180, .25, .25, 0 , c_white, 1);
		break;
		
		default:
		draw_sprite_ext(s_upgrade_slashdash,        0, 40, 180, .25, .25, 0 , c_white, 1);
		draw_sprite_ext(s_upgrade_tripleprojectile, 0, 300, 180, .25, .25, 0 , c_white, 1);
		//draw_text_transformed(40,180,"Upgrades Dash to Slash Dash. Attacking while dashing deals damage",.5,.5,0)
		//draw_text_transformed(300,180,"Upgrades the Combo Projectile to fire 3 projectiles in an arc.",.5,.5,0)
		break;
	
	}
	
	if o_input.select_ or o_input.action_one_ {
		if selection == true {
			global.dash_attack = true;	
			global.heavy_swing = false;
			instance_activate_all();
			if instance_exists(block_fight) {
				instance_deactivate_object(block_fight);
			}
			paused_sprite = noone;
		} else if selection == false {
			global.heavy_swing = true;
			global.dash_attack = false;
			instance_activate_all();
			if instance_exists(block_fight) {
				instance_deactivate_object(block_fight);
			}
			paused_sprite = noone;
		}
	}
	
}