// Draw EXITING...
if(exit_count > 0){
	a = exit_count/exit_count_goal;
	c = c_black;
	// Draw white outline kinda
	draw_text_color(x+exit_text_x+1, y+exit_text_y, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x-1, y+exit_text_y, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x, y+exit_text_y+1, "EXIT", c, c, c, c, a/2);
	draw_text_color(x+exit_text_x, y+exit_text_y-1, "EXIT", c, c, c, c, a/2);
	c = c_red;
	draw_text_color(x+exit_text_x, y+exit_text_y, "EXIT", c, c, c, c, a);
}

// Change controls menu
if(is_changing_controls){
	// Draw black BG
	pp_width = player_preview.sprite_width*player_preview.image_xscale;
	pp_height = player_preview.sprite_height*player_preview.image_yscale;
	draw_sprite_ext(Spr_Pixel, 0, player_preview.x-pp_width/2, player_preview.y-pp_height/2, pp_width*1.2, pp_height, 0, c_black, 1);
	
	x_draw = player_preview.x - pp_width/2 + control_text_x;
	y_draw = player_preview.y -6*image_yscale;
	c = control_text_color;
	x_s = image_xscale*control_text_x_scale;
	y_s = image_yscale;
		
	if(!is_setting_new_input){
		if(controller_index == 9){
			map = global.k1_bindings;
		}
		else if(controller_index == 10){
			map = global.k2_bindings;
		}
		else{
			map = global.controller_bindings[controller_index];
		}
		// Draw current option
		i = control_text_index;
		input_string = input_to_string(ds_map_find_value(map, control_text_list[i][1]));
		draw_text_transformed_color(x_draw, y_draw, control_text_list[i][0], x_s, y_s, 0, c, c, c, c, 1);
		draw_text_transformed_color(x_draw+control_text_x_distance, y_draw, input_string, x_s, y_s, 0, c, c, c, c, 1);
		// Draw options above
		i -= 1;
		if(i < 0){
			i = array_length(control_text_list)-1;
		}
		input_string = input_to_string(ds_map_find_value(map, control_text_list[i][1]));
		draw_text_transformed_color(x_draw, y_draw-control_text_spacing, control_text_list[i][0], x_s, y_s, 0, c, c, c, c, 0.5);
		draw_text_transformed_color(x_draw+control_text_x_distance, y_draw-control_text_spacing, input_string, x_s, y_s, 0, c, c, c, c, 0.5);
		i -= 1;
		if(i < 0){
			i = array_length(control_text_list)-1;
		}
		input_string = input_to_string(ds_map_find_value(map, control_text_list[i][1]));
		draw_text_transformed_color(x_draw, y_draw-control_text_spacing*2, control_text_list[i][0], x_s, y_s, 0, c, c, c, c, 0.25);
		draw_text_transformed_color(x_draw+control_text_x_distance, y_draw-control_text_spacing*2, input_string, x_s, y_s, 0, c, c, c, c, 0.25);
		// Draw options below
		i = control_text_index+1;
		if(i > array_length(control_text_list)-1){
			i = 0;
		}
		input_string = input_to_string(ds_map_find_value(map, control_text_list[i][1]));
		draw_text_transformed_color(x_draw, y_draw+control_text_spacing, control_text_list[i][0], x_s, y_s, 0, c, c, c, c, 0.5);
		draw_text_transformed_color(x_draw+control_text_x_distance, y_draw+control_text_spacing, input_string, x_s, y_s, 0, c, c, c, c, 0.5);
		i += 1;
		if(i > array_length(control_text_list)-1){
			i = 0;
		}
		input_string = input_to_string(ds_map_find_value(map, control_text_list[i][1]));
		draw_text_transformed_color(x_draw, y_draw+control_text_spacing*2, control_text_list[i][0], x_s, y_s, 0, c, c, c, c, 0.25);
		draw_text_transformed_color(x_draw+control_text_x_distance, y_draw+control_text_spacing*2, input_string, x_s, y_s, 0, c, c, c, c, 0.25);
	}
	else{
		draw_text_color(x_draw, y_draw, "PRESS NEW INPUT", c, c, c, c, 1);
	}
}