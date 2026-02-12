// Show music options
if(position_meeting(x+32, y+64, Obj_Character_Picker)){
	// Draw a black square as BG
	draw_sprite_ext(Spr_Pixel, 0, x+64, y-text_bg_height/2, text_bg_width, text_bg_height, 0, c_black, text_bg_alpha);
	
	index = global.battle_music_index;
	draw_text_color(x+x_draw_text, y, global.music_list[index][0], text_color, text_color, text_color, text_color, 1);
	// Draw songs above
	index -= 1;
	if(index < 0){
		index = array_length(global.music_list)-1;
	}
	draw_text_color(x+x_draw_text, y-y_draw_text_spacing, global.music_list[index][0], text_color, text_color, text_color, text_color, 0.5);
	index -= 1;
	if(index < 0){
		index = array_length(global.music_list)-1;
	}
	draw_text_color(x+x_draw_text, y-y_draw_text_spacing*2, global.music_list[index][0], text_color, text_color, text_color, text_color, 0.25);
	// Draw songs below
	index = global.battle_music_index+1;
	if(index > array_length(global.music_list)-1){
		index = 0;
	}
	draw_text_color(x+x_draw_text, y+y_draw_text_spacing, global.music_list[index][0], text_color, text_color, text_color, text_color, 0.5);
	index += 1;
	if(index > array_length(global.music_list)-1){
		index = 0;
	}
	draw_text_color(x+x_draw_text, y+y_draw_text_spacing*2, global.music_list[index][0], text_color, text_color, text_color, text_color, 0.25);
}
