draw_self();
// Draw mini preview
draw_sprite_ext(global.arena_images[global.arena_index], 0, x+3, y+56, mini_preview_draw_scale, mini_preview_draw_scale, 0, c_white, 1);

if(position_meeting(x+32, y+64, Obj_Character_Picker)){
	// Draw a black square as BG
	draw_set_alpha(bg_alpha);
	draw_rectangle_color(x, y-58, x-122, y+200, bg_color, bg_color, bg_color, bg_color, false);
	draw_set_alpha(1);
}