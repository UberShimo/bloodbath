// Show BG options
if(position_meeting(x+32, y+64, Obj_Character_Picker)){
	
	// Gotta draw all parallax images...
	index = global.BG_index;
	for(i = 0; i < 4; i++){
		draw_sprite_part_ext(global.BG_list[index], i, 0, 0, BG_draw_width, BG_draw_height, x+x_draw, y+BG_y_draw, BG_draw_scale, BG_draw_scale, c_white, 1);
	}
	
	// Draw BG above
	index -= 1;
	if(index < 0){
		index = array_length(global.BG_list)-1;
	}
	for(i = 0; i < 4; i++){
		draw_sprite_part_ext(global.BG_list[index], i, 0, 0, BG_draw_width, BG_draw_height, x+x_draw, y+BG_y_draw-BG_y_draw_spacing, BG_draw_scale, BG_draw_scale, c_white, next_BG_alpha);
	}
	// Draw BG below
	index = global.BG_index+1;
	if(index > array_length(global.BG_list)-1){
		index = 0;
	}
	for(i = 0; i < 4; i++){
		draw_sprite_part_ext(global.BG_list[index], i, 0, 0, BG_draw_width, BG_draw_height, x+x_draw, y+BG_y_draw+BG_y_draw_spacing, BG_draw_scale, BG_draw_scale, c_white, next_BG_alpha);
	}
	
	// Draw arrows
	draw_sprite_ext(Spr_Triangle, 0, arrow_x, arrow_y-arrow_distance, arrow_scale, arrow_scale, 90, c_white, 1);
	draw_sprite_ext(Spr_Triangle, 0, arrow_x, arrow_y+arrow_distance, arrow_scale, arrow_scale, -90, c_white, 1);
}
