/// @description Parallax background
switch (room) {
	
	case r_world:
		var _layer_id_1 = layer_get_id("Background");
		var _layer_id_2 = layer_get_id("Backgrounds_1");

		layer_x(_layer_id_1, lerp(0,camera_get_view_x(view_camera[0]), 0.8));
		layer_y(_layer_id_1, lerp(0,camera_get_view_y(view_camera[0]), 0.6));

		layer_x(_layer_id_2, lerp(0,camera_get_view_x(view_camera[0]), 0.4));
		layer_y(_layer_id_2, lerp(0,camera_get_view_y(view_camera[0]), 0.3));
	break;
	
	case r_room3:
		var _layer_id_1 = layer_get_id("Backgrounds_1");

		layer_x(_layer_id_1, lerp(0,camera_get_view_x(view_camera[0]), 0.8));
		layer_y(_layer_id_1, lerp(0,camera_get_view_y(view_camera[0]), 0.6));
		
	break;
	
	
	case r_room4:
		var _layer_id_1 = layer_get_id("Background");

		layer_x(_layer_id_1, lerp(0,camera_get_view_x(view_camera[0]), 0.8));
		layer_y(_layer_id_1, lerp(0,camera_get_view_y(view_camera[0]), 0.6));
		
	break;
	
	case r_room5:
	var _layer_id_1 = layer_get_id("Background");

	layer_x(_layer_id_1, lerp(0,camera_get_view_x(view_camera[0]), 0.9));
	layer_y(_layer_id_1, lerp(0,camera_get_view_y(view_camera[0]), 0.8));
		
	break;
	
	case r_room6:
	var _layer_id_1 = layer_get_id("Background");

	layer_x(_layer_id_1, lerp(0,camera_get_view_x(view_camera[0]), 0.8));
	layer_y(_layer_id_1, lerp(0,camera_get_view_y(view_camera[0]), 0.6));
		
	break;
	
	case r_room7:
	var _layer_id_1 = layer_get_id("Background");

	layer_x(_layer_id_1, lerp(0,camera_get_view_x(view_camera[0]), 0.8));
	layer_y(_layer_id_1, lerp(0,camera_get_view_y(view_camera[0]), 0.6));
		
	break;


}