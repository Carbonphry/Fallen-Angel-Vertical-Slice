global.current_stage = room;

if instance_exists(global.player_start_position)
{
	if instance_exists(o_player)
	{
			o_player.persistent = false;
			o_player.x = global.player_start_position.x;
			o_player.y = global.player_start_position.y;
			o_player.layer = layer_get_id("Solids");
			o_player.speed = 0;
	} else
	{
		var _start_x = global.player_start_position.x
		var _start_y = global.player_start_position.y
		instance_create_layer(_start_x, _start_y, "Solids", o_player);
	}
	global.player_start_position = noone;
}

display_set_gui_size(480, 270);

//Stop sounds from prev
//audio_stop_all();
//Sounds
switch (room) {
	
	
	
	case r_init:
	audio_play_sound(a_studio_intro,0,false); 
	break;
	
	case r_title:
	audio_stop_sound(a_studio_intro); 
	break;
	
	#region OLD LEVELS
	case r_world:
	if global.coop {
		instance_create_layer(0,0,"Solids",o_input2);
		instance_create_layer(o_player.x+8,o_player.y+8,"Solids",o_player2);
	}
	audio_play_sound(a_ambience_tutorial,2,true);
	break;
	case r_protodung:
	if global.coop {
		alarm_set(2,1);
	}
	audio_stop_sound(a_ambience_tutorial);
	audio_play_sound(a_music_dungeon,2,true);
	audio_play_sound(a_ambience_dungeon,2,true);
	break;
	
	case r_garden2:
	if global.coop {
		alarm_set(2,1);
	}
	audio_stop_sound(a_ambience_dungeon);
	audio_play_sound(a_music_garden,2,true);
	break;
	#endregion
	//////////////////////
	
	case r_intro_room1:
	if !audio_is_playing(a_level_intro_room1_beach) {
		audio_play_sound(a_level_intro_room1_beach,2,true); 
	}
	if !audio_is_playing(a_level_intro_room1_intro) {
		audio_play_sound(a_level_intro_room1_intro,1,false); 
	}
	if !audio_is_playing(a_awake) {
		audio_play_sound(a_awake,1,false); 
	}
	audio_stop_sound(a_menu_loop);
	audio_stop_sound(a_level_intro_music);
	audio_stop_sound(a_level_intro_room2and3_waterfall);
	break;
	
	case r_intro_room2:
	if !audio_is_playing(a_level_intro_room2and3_waterfall) {
		audio_play_sound(a_level_intro_room2and3_waterfall,5,true);
	}
	if !audio_is_playing(a_level_intro_music) {
		audio_play_sound(a_level_intro_music,3,true); 
	}
	audio_stop_sound(a_level_intro_room1_beach);

	break;
	
	case r_intro_room3:
	
	audio_stop_sound(a_level_intro_room4_tower);
	break;
	
	case r_intro_room3_2:
	audio_stop_sound(a_level_intro_music);
	audio_stop_sound(a_level_intro_room4_tower);
	audio_stop_sound(a_level_intro_room2and3_waterfall);
	if !audio_is_playing(a_level_intro_room4_tower) {
		audio_play_sound(a_level_intro_room4_tower,2,true);
	}
	break;
	
	case r_intro_room4:
	
	audio_stop_sound(a_level_intro_room5_towerinterior);
	audio_stop_sound(a_level_intro_room2and3_waterfall);
	audio_stop_sound(a_level_intro_music);
	if !audio_is_playing(a_ambience_tutorial) {
		audio_play_sound(a_ambience_tutorial, 2, true);
	}
	break;
	
	case r_intro_room5:
	global.room4block = false;
	audio_stop_sound(a_level_intro_room4_tower);
	audio_stop_sound(a_level_intro_room6_towerexterior);
	audio_stop_sound(a_level_intro_music);
	audio_stop_sound(a_level_intro_room6);
	if !audio_is_playing(a_level_intro_room5_towerinterior) {
		audio_play_sound(a_level_intro_room5_towerinterior,2,true); 
	}
	break;
	
	case r_intro_room6:
	global.room5block = false;
		if !audio_is_playing(a_level_intro_music) and !audio_is_playing(a_level_intro_room6) {
		audio_play_sound(a_level_intro_room6,3,true); 
	}
	audio_stop_sound(a_level_intro_room6_towerexterior);
	audio_stop_sound(a_level_intro_room1_beach);
	if !audio_is_playing(a_level_intro_room6_towerexterior) {
		audio_play_sound(a_level_intro_room6_towerexterior,2,true);
	}
	break;
	
	case r_intro_room7:
	audio_stop_sound(a_level_intro_room6); 
	audio_stop_sound(a_level_intro_room1_beach);
	audio_stop_sound(a_music_abdiel);
	break;
	
	case r_gabriel_ancientcity_room1:
	audio_stop_sound(a_level_intro_room1_beach);
	break;
	
	case r_gabriel_ancientcity_room2:
	if global.elevator_restart {
		o_level_gabriel_ancientcity_room2to1_elevator.y = 592;
		o_level_gabriel_ancientcity_room2to1_elevator.boo = true;
		global.elevator_restart = false;
	}
	break;

}

