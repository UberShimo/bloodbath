// Show music options
if(position_meeting(x, y, Obj_Character_Picker)){
	// Draw a black square as BG
	draw_sprite_ext(Spr_Pixel, 0, x-32, y-128, -256, 256, 0, c_black, 0.75);
	
	index = global.BG_index;
	draw_sprite_ext(global.BG_list[index], 0, x+x_draw, y+y_draw, BG_draw_scale, BG_draw_scale, 0, c_white, 1);
	// Draw BG above
	index -= 1;
	if(index < 0){
		index = array_length(global.BG_list)-1;
	}
	draw_sprite_ext(global.BG_list[index], 0, x+x_draw, y+y_draw-y_draw_spacing, BG_draw_scale, BG_draw_scale, 0, c_white, 1);
	// Draw BG below
	index = global.BG_index+1;
	if(index > array_length(global.BG_list)-1){
		index = 0;
	}
	draw_sprite_ext(global.BG_list[index], 0, x+x_draw, y+y_draw+y_draw_spacing, BG_draw_scale, BG_draw_scale, 0, c_white, 1);
}
