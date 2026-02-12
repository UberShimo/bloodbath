draw_self();
// Draw mini preview
for(i = 0; i < 4; i++){
	draw_sprite_ext(global.BG_list[global.BG_index], i, x+3, y+56, mini_preview_draw_scale, mini_preview_draw_scale, 0, c_white, 1);
}

if(position_meeting(x+32, y+64, Obj_Character_Picker)){
	// Draw a black square as BG
	draw_set_alpha(bg_alpha);
	draw_rectangle_color(x, y-58, x-132, y+210, bg_color, bg_color, bg_color, bg_color, false);
	draw_set_alpha(1);
}