/// @description Text
// You can write your code in this editor

/*draw_self();
image_alpha = .7;*/
draw_sprite_ext(s_dialog_box,0,0,0,1,1,0,c_white,.7);

/*if ( time < text_length ) {
	time += spd;
	print = string_copy(text,0,time);
}*/
//print = text;

///Render textbox and text
//draw_set_alpha(alpha);
//if (alpha <1) alpha += spd/10; else alpha = 1;

//draw_set_font(font);
//draw_set_color(c_gray);
draw_set_color(c_white);
draw_set_halign(fa_center);
//draw_set_valign(fa_top);
//draw_text(-100,+100,"la wea klaioodaoda dddddddddddddddddddddddddddddddddddddd");

if o_input.down_pressed_ and select_ <=2 and alarm[0]<=0 {
	select_++;	
	alarm[0] = global.one_second*.2;
} else if o_input.up_pressed_  and select_ >=2 and alarm[0]<=0 {
	select_--;
	alarm[0] = global.one_second*.2;
}

if (select_ == 1) {
	draw_text_ext_transformed_color(160 + padding+75,195 + padding,text,10,maxlength,1.2,1.2,0,c_red,c_red,c_red,c_red,1);
} else {
	draw_text_ext(160 + padding+75,195 + padding,text,10,maxlength);
}

if (select_ == 2) {
	draw_text_ext_transformed_color(160 + padding+75,220 + padding,text2,10,maxlength,1.2,1.2,0,c_red,c_red,c_red,c_red,1);
} else {
draw_text_ext(160 + padding+75,220 + padding,text2,10,maxlength);
}

if (select_ == 3) {
	draw_text_ext_transformed_color(160 + padding+75,250 + padding,text3,10,maxlength,1.2,1.2,0,c_red,c_red,c_red,c_red,1);
} else {
draw_text_ext(160 + padding+75,250 + padding,text3,10,maxlength);
}
draw_set_alpha(1);
draw_set_halign(fa_left);

//Chest and Char Name
/*switch (character) {
	
	/*case CHEST_GRACE:
	name = "Lucifer"
	break;*/
/*	case CHEST_ABDIEL:
	name = "Abdiel";
	break;
	
}
draw_sprite(character,0,50,268);
draw_sprite_ext(character_2,0,400,240,-1,1,0,1,1);*/
switch (chest_active) { 
	
	case CHEST_ABDIEL:
	draw_sprite_ext(s_chest_abdiel,0,-24,142,1,1,0,image_blend,1);
	draw_sprite_ext(s_chest_lucifer,0,370,142,1,1,0,image_blend+c_gray,1);
	break;
	
	case CHEST_LUCIFER:
	draw_sprite_ext(s_chest_abdiel,0,-24,142,1,1,0,image_blend+c_gray,1);
	draw_sprite_ext(s_chest_lucifer,0,370,142,1,1,0,image_blend,1);
	break;
}


//draw_set_halign(fa_center);
//draw_text(60,220,name)
//