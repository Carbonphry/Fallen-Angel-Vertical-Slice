/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_player) then exit;


image_index = round(ego_pts);
if ego_pts <=0 or image_index <= 0 {
	image_index = 0;
	ego_pts = 0;
} else if ego_pts <= 40 and ego_pts >0 {
	ego_pts -=0.13;
}

if ego_pts > 40 {
	ego_pts =40;
}

draw_self();

draw_text(x,y,string(ego_pts));



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