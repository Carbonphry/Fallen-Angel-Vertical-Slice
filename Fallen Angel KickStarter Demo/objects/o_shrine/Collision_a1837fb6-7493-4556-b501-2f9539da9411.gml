/// @description Insert description here
// You can write your code in this editor
//o_hud.paused_ = true;

//with o_hud {
if usable and /*hurtbox_entity_can_be_hit_by(other)*/point_distance(o_player.x,o_player.y,x,y) < 30 {
	usable = false;
	paused_sprite = sprite_create_from_surface(application_surface, 0 , 0, view_wport[0], view_hport[0], false, false, 0, 0);
	instance_deactivate_all(true);
	instance_activate_object(o_hud);
	instance_activate_object(o_input);
}	
//}
//paused_sprite_ = sprite_create_from_surface(application_surface, 0 , 0, view_wport[0], view_hport[0], false, false, 0, 0);

//instance_activate_object(o_hud)