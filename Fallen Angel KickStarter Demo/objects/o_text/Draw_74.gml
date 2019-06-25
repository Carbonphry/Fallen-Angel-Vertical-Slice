/// @description Text
// You can write your code in this editor

/*draw_self();
image_alpha = .7;*/
draw_sprite_ext(s_dialog_box,0,0,0,1,1,0,c_white,.7);

if ( time < text_length ) {
	time += spd;
	print = string_copy(text,0,time);
}

///Render textbox and text
draw_set_alpha(alpha);
if (alpha <1) alpha += spd/10; else alpha = 1;

//draw_set_font(font);
draw_set_color(c_gray);
draw_set_color(c_white);
draw_set_halign(fa_center);
//draw_set_valign(fa_top);
draw_text_ext(
	160 + padding+75,
	200 + padding,
	print,
	font_size+(font_size/2),
	maxlength
);
draw_set_alpha(1);
draw_set_halign(fa_left);

//Chest and Char Name
/*switch (character) {
	
	case CHEST_GRACE:
	name = "Lucifer"
	break;
	
	case CHEST_ABDIEL:
	name = "Abdiel";
	break;
	
}*/
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

