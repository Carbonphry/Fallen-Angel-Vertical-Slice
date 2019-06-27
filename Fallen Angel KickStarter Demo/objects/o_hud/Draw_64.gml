if global.player_health <= 0 then exit;
if room == r_ending then exit;

if sprite_exists(freeze_sprite_) {
	draw_sprite_ext(freeze_sprite_, 0, 0, 0, paused_sprite_scale, paused_sprite_scale, 0 , c_white, 1);
}

if sprite_exists(paused_sprite_)
{
	draw_sprite_ext(paused_sprite_, 0, 0, 0, paused_sprite_scale, paused_sprite_scale, 0 , c_white, 1);
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, gui_width_, gui_height_, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	anim_select +=.1;
	if anim_select >= 3 then anim_select = 0;

	if index_ == pauseoptions.resume {
		draw_sprite(s_button_resume_selected,anim_select,240,150);
	} else {
		draw_sprite(s_button_resume,0,240,150);
	}

	if index_ == pauseoptions.main_menu {
		draw_sprite(s_button_main_menu_selected,anim_select,240,180);
	} else {
		draw_sprite(s_button_main_menu,0,240,180);
	}
	
	if index_ == pauseoptions.quit {
		draw_sprite(s_button_exit_selected,anim_select,240,210);
	} else {
		draw_sprite(s_button_exit,0,240,210);
	}
	
	//Pause Menu
	/*draw_set_halign(fa_center)
	for (var _i = 0; _i<option_length_; _i++)
	{
	if _i == index_
	{
		draw_set_color(menu_color_);
	} else
	{
		draw_set_color(menu_dark_color_);
	}
	draw_text_transformed(x_, y_+_i*25, option_[_i], 1.5, 1.5, 0);
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);*/
	
}

if !text_dialog {
var _ammount = global.player_max_health/global.player_health;
dmg_anim++; 
if dmg_anim > 47 then dmg_anim = 0;
if global.player_health < 4 {
	//gpu_set_blendmode(bm_add);
	draw_sprite_ext(s_lowhealth_screen,dmg_anim,0,0,1,1,0,image_blend,_ammount*.1);
	//gpu_set_blendmode(bm_normal);
}
//Hud
draw_sprite(s_hud_bar, 0, x_bar_, y_bar_);

//draw_sprite(s_hud_stance_power,0, x_bar_-19, y_bar_-33);

var _life_size = global.player_health/global.player_max_health;
var _stamina_size = global.player_stamina/global.player_max_stamina;
if global.player_health > 0
{
	draw_sprite_part(s_hud_bar_life, 0, 0, 0, 133*_life_size, 8, x_bar_+25, y_bar_-11);
}
draw_sprite_part(s_hud_bar_stamina, 0, 0, 0, 112*_stamina_size, 6,x_bar_+27, y_bar_+1);

if show_stamina {
	low_stam_anim+=.2; 
	if low_stam_anim > 2 then low_stam_anim = 0;
	
	draw_sprite(s_hud_lowstamina,low_stam_anim, x_bar_,y_bar_);
	if !audio_is_playing(a_player_lowstamina) {
		audio_play(a_player_lowstamina);
	}
}
draw_sprite(s_hud_heal_box, 0, x_bar_ - 40, y_bar_+186);
draw_sprite(s_hud_heal_box_counter, core_count, x_bar_ - 40, y_bar_+186);


	if core_count > 0 {
		draw_sprite(s_small_heal_item, core_anim,x_bar_ - 24 , y_bar_ + 209);
		 core_anim += .15;
		if  core_anim > 7 then core_anim = 0;
		/*if core_count > 1 {
			draw_text(x_bar_+44, y_bar_+209,string(core_count))
		}*/
	}
}


//draw_sprite_ext(s_hud_bar_stamina, 0, x_bar_+27, y_bar_+4, _stamina_size, 1, 0, c_white, 1);


//Text system
if instance_exists(o_abdiel) and !instance_exists(o_text) {
	var boss_life_size = o_abdiel.health_/o_abdiel.max_health_ ;
	draw_text_color(x_bar_b+5/*x_bar_b+30*/,y_bar_b-14,"Holy Seraph Abdiel",c_white,c_yellow,c_white,c_yellow,1);
	draw_sprite(s_boss_bar,0,x_bar_b,y_bar_b);
	draw_sprite_ext(s_boss_bar_life, 0, x_bar_b, y_bar_b, boss_life_size, 1, 0, c_white, 1);
}

if text_dialog {
	
	o_player.state_ = player.not_playable;
	if instance_exists(o_player2) {
		o_player2.state_ = player.not_playable;
	}
	//instance_create_layer(x,y,);
	//create_dialog("The traitor returns.", 0.5, +340,+90,CHEST_ABDIEL);
	if !instance_exists(o_text) {
		create_dialog("Abdiel: The traitor returns.", 0.5, 0,0,CHEST_ABDIEL);
		alarm[2] = global.one_second*2;
	}
	
	if o_input.dialog_next_ and !skip {
		o_text.spd = 2;
		skip = true;
		alarm[1] = room_speed*.5;
	}
	
	if o_input.dialog_next_ and alarm[1] <=0 and skip {
		//alarm[1] = room_speed*.6;
		skip = false;
		switch (page) {
			
			case 1:
			alarm[2] = global.one_second*.1;
			instance_destroy(o_text,false);
			//create_dialog("A.I fight against the tyranny of creation. B.You are a traitor to your own kind. My choice was freedom. Your choice was servitude.   C.Prepare to die, virtuous dog.", 0.35, 0,0,CHEST_ABDIEL);
			with instance_create_layer(0,0,"UI", o_text_options) {
				text  = "A. I fight against the tyranny of creation.";
				text2 = "B. My choice was freedom. Your choice was servitude.";
				text3 = "C. Prepare to die, virtuous dog.";
				chest_active = CHEST_LUCIFER;
			}

			//create_dialog("Lucifer: My choice was freedom. Your choice was servitude.", 0.35, 0,0,CHEST_ABDIEL);

			page = 2;
			break;
			
			case 2:
			alarm[2] = global.one_second*2;
			if instance_exists(o_text_options) {
			switch (o_text_options.select_) {
				
				case 1:
				instance_destroy(o_text,false);
				create_dialog("Abdiel: My faith provides strength. You will lose again, heretic.", 0.5, 0,0,CHEST_ABDIEL);
				break;
				
				case 2:
				instance_destroy(o_text,false);
				create_dialog("Abdiel: Following an unwise heretic like you to hell...that's servitude.", 0.5, 0,0,CHEST_ABDIEL);
				break;
				
				case 3:
				instance_destroy(o_text,false);
				create_dialog("Abdiel: Losing Paradise wasn't enough punishment for you?", 0.5, 0,0,CHEST_ABDIEL);
				break;
				
			}
			}
			//create_dialog("Abdiel: Following an unwise heretic like you to hell...that is servitude.", 0.35, 0,0,CHEST_ABDIEL);
			page = 3;
			break;
			
			case 3:
			instance_destroy(o_text,false);
			text_dialog = false;
			o_player.state_ = player.idle;
			//create_dialog("Following an unwise heretic like you to hell...that is servitude.", 0.3, 0,0,CHEST_ABDIEL);
			//page = 4;
			break;
		}
	
	}
	
}


/*
var _gem_string = string(global.player_gems);
var _text_width = string_width(_gem_string);
var _x_gems = gui_width_ - _text_width;
var _y_gems = gui_height_ - 10;
draw_sprite(s_gem, 0, _x_gems - 14, _y_gems + 4);
draw_text(_x_gems-8, _y_gems - 1, _gem_string);
*/

///OLD inventory system
//inventory_draw(4,66);

