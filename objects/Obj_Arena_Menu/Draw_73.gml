// Show BG options
if(position_meeting(x, y, Obj_Character_Picker)){
	index = global.arena_index;
	draw_sprite_ext(global.arena_images[index], 0, x+x_draw, y+y_draw, arena_draw_scale, arena_draw_scale, 0, c_white, 1);
	
	draw_set_alpha(0.25);
	// Draw arena above
	index -= 1;
	if(index < 0){
		index = array_length(global.arena_images)-1;
	}
	draw_sprite_ext(global.arena_images[index], 0, x+x_draw, y+y_draw-y_draw_spacing, arena_draw_scale, arena_draw_scale, 0, c_white, next_arena_alpha);
	// Draw arena below
	index = global.arena_index+1;
	if(index > array_length(global.arena_images)-1){
		index = 0;
	}
	draw_sprite_ext(global.arena_images[index], 0, x+x_draw, y+y_draw+y_draw_spacing, arena_draw_scale, arena_draw_scale, 0, c_white, next_arena_alpha);
	draw_set_alpha(1);
	
	// Draw arrows
	draw_sprite_ext(Spr_Triangle, 0, arrow_middle, y-arrow_distance, arrow_scale, arrow_scale, 90, c_white, 1);
	draw_sprite_ext(Spr_Triangle, 0, arrow_middle, y+arrow_distance-12, arrow_scale, arrow_scale, -90, c_white, 1);
}
