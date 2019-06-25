/// @description Debug

	//Draw self
	draw_self();
	
	//Light Collider debugging
	if (debug_mode == true)
	{
		if (point_in_rectangle(mouse_x,mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
		{
			//Draw boundaries
			draw_set_color(c_white);
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		
			var corner_size = array_length_1d(corners);
			var i1;
				
			for (var j = 0; j < corner_size; ++j) 
			{
				//Drawing corner
				i1 = corners[j];
				draw_circle( i1[0], i1[1], 4, false);
			}
		}
	}