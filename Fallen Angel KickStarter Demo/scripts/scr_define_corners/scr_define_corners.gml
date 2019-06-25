///@description Update the values inside a light collider
///scr_define_corners()

	//Set Up
	var hold_image_angle = image_angle;
	image_angle = 0;

	//Values for checking light working
	corners = array_create(4, 0);
	
	//Origin
	var origin_x = x;
	var origin_y = y;
	
	for (var i = 0; i < 4; ++i) 
	{
	    //Create Each Corner
		var i_array = array_create(4, 0);
		
		//Lenght and angle
		switch(i)
		{
			case 0:
				//Left top
				i_array[2] = point_distance( origin_x, origin_y, bbox_left, bbox_top);
				i_array[3] = point_direction( origin_x, origin_y, bbox_left, bbox_top);
			break;
			case 1:
				//Right top
				i_array[2] = point_distance( origin_x, origin_y, bbox_right, bbox_top);
				i_array[3] = point_direction( origin_x, origin_y, bbox_right, bbox_top);
			break;
			case 2:
				//Right Bottom
				i_array[2] = point_distance( origin_x, origin_y, bbox_right, bbox_bottom);
				i_array[3] = point_direction( origin_x, origin_y, bbox_right, bbox_bottom);
			break;
			case 3:
				//Left Bottom
				i_array[2] = point_distance( origin_x, origin_y, bbox_left, bbox_bottom);
				i_array[3] = point_direction( origin_x, origin_y, bbox_left, bbox_bottom);
			break;
		}
		
		//Set
		corners[i] = i_array;
	}
	
	//Get Back
	image_angle = hold_image_angle;