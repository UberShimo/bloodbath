// Show BG options
if(position_meeting(x, y, Obj_Character_Picker)){
	// Draw a black square as BG
	draw_sprite_ext(Spr_Pixel, 0, x-32, y-128, -256, 256, 0, c_black, 0.75);
	
	index = global.arena_index;
	draw_sprite_ext(global.arena_images[index], 0, x+x_draw, y+y_draw, arena_draw_scale, arena_draw_scale, 0, c_white, 1);
	// Draw BG above
	index -= 1;
	if(index < 0){
		index = array_length(global.arena_images)-1;
	}
	draw_sprite_ext(global.arena_images[index], 0, x+x_draw, y+y_draw-y_draw_spacing, arena_draw_scale, arena_draw_scale, 0, c_white, 1);
	// Draw BG below
	index = global.arena_index+1;
	if(index > array_length(global.arena_images)-1){
		index = 0;
	}
	draw_sprite_ext(global.arena_images[index], 0, x+x_draw, y+y_draw+y_draw_spacing, arena_draw_scale, arena_draw_scale, 0, c_white, 1);
}
