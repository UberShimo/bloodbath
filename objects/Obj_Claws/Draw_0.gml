event_inherited();

if(ds_list_size(rewind_list) >= rewind_length-1){
	// Draw rewind position
	pos = ds_list_find_value(rewind_list, 0);
	
	gpu_set_fog(true, c_lime, 0, 1000);
	draw_sprite_ext(pos[2], pos[3], pos[0], pos[1], pos[4], 1, 0, c_white, 0.2);
	gpu_set_fog(false, c_lime, 0, 1000);
}