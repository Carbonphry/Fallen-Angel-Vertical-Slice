/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_player) then exit;

switch state {

	case 0:
	
	if ego_pts <=0  {
		image_index = 0;
		ego_pts = 0;
	} else if ego_pts > 0 and ego_add <= 0 {
		ego_pts -=0;
	}
	if ego_add > 0 {
		ego_add-=.5;
		ego_pts += .5;
	}

	if ego_pts >= 40 {
		ego_pts =40;
		//state = 1;
		sprite_index = s_hud_pride_max;
		instance_create_layer(-200,-100,"UI", o_tutorial_demonmode);
		
		//instance_create_layer(-200 ,-100,"UI", o_pride_meter_demonmode);
	} else {
		image_index = ego_pts;
		sprite_index = s_hud_pride;
	}
	
	if o_input.action_five_ and ego_pts == 40 {
		state = 1;
		instance_create_layer(-200 ,-100,"UI", o_pride_meter_demonmode);
		sprite_index = s_hud_pride_empty;
		instance_destroy(o_tutorial_demonmode);
	}
	break;

	case 1:
	
		//image_index = round(ego_pts);
		
		if ego_pts > 0  {
			ego_pts -=0.05;
		} else {
			ego_add = 0;
			ego_pts = 0;
			
		}
		if !instance_exists(o_pride_meter_demonmode) {
			state = 0;
		}
	
	break;



}

draw_self();

//draw_text(x,y,string(ego_pts));



/*if o_player.power_stance {
		sprite_index = s_hud_pride_max;
	} else {
		sprite_index = s_hud_pride;
	}


/*if o_player.z == o_player.z_ground {
	if o_player.power_stance {
		sprite_index = s_hud_pride_max;
	} else {
		sprite_index = s_hud_pride;
	}
} else {
	sprite_index = s_hud_stance_flying;
}*/
/*switch state {

	case 1:
	if ego_pts >= 10 {
		state = 2;
	} 
	break;
	
	case 2:
	if ego_pts >= 20 {
		state = 3;
	} else if ego_pts < 10 {
		state = 1;
	}
	break;
	
	case 3:
	if ego_pts >= 30 {
		state = 4;
	} else if ego_pts < 20 {
		state = 1;
	}
	break;
	
	case 4:
	if ego_pts >= 40 {
		state = o_player.power_stance = true;
	} else if ego_pts < 30 {
		state = 3;
	}
	break;

}




/*if anim != 6 {
	draw_sprite(s_hud_stance_on_effect,anim,x+1,y-4);
	anim +=.2;
}
if anim >= 5 {
	anim = 6;
}