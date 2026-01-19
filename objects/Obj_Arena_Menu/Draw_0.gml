draw_self();
// Draw mini preview
draw_sprite_ext(global.arena_images[global.arena_index], 0, x-30, y+8, mini_preview_draw_scale, mini_preview_draw_scale, 0, c_white, 1);

if(position_meeting(x, y, Obj_Character_Picker)){
	// Draw a black square as BG
	draw_set_alpha(bg_alpha);
	draw_rectangle_color(x-40, y-134, x-196, y+120, bg_color, bg_color, bg_color, bg_color, false);
	draw_set_alpha(1);
}