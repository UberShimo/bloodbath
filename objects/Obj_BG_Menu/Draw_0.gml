draw_self();
// Draw mini preview
for(i = 0; i < 4; i++){
	draw_sprite_ext(global.BG_list[global.BG_index], i, x-30, y+8, mini_preview_draw_scale, mini_preview_draw_scale, 0, c_white, 1);
}

if(position_meeting(x, y, Obj_Character_Picker)){
	// Draw a black square as BG
	draw_set_alpha(bg_alpha);
	draw_rectangle_color(x-48, y-132, x-196, y+128, bg_color, bg_color, bg_color, bg_color, false);
	draw_set_alpha(1);
}