event_inherited();

// Dummy UI
if(dummy != noone){
	p2_ui_hp = dummy.HP/dummy.max_HP;
	p2_ui_meter = dummy.meter/dummy.max_meter;
	p2_ui_hearts = 1;
	p2_ui_face = dummy.face;
	p2_ui_face_index = dummy.face_index;
	x_line = display_get_gui_width()-48*ui_pixel_size-corner_offset;
	y_line = 2*ui_pixel_size+corner_offset;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line-2*ui_pixel_size, y_line, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line-2*ui_pixel_size, y_line, -ui_pixel_size*p2_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 1, x_line-meter_frame_x*ui_pixel_size, y_line+30*ui_pixel_size, -ui_pixel_size*p2_ui_meter, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 0, x_line-meter_frame_x*ui_pixel_size, y_line+30*ui_pixel_size, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p2_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line-hearts_x*ui_pixel_size-hearts_distance*i*ui_pixel_size*heart_size, y_line+hearts_y*ui_pixel_size, ui_pixel_size*heart_size, ui_pixel_size*heart_size, 0, c_white, 1);
	}
	// Face
	draw_sprite_ext(p2_ui_face, p2_ui_face_index, x_line+22*ui_pixel_size, y_line+22*ui_pixel_size, -ui_pixel_size*face_size, ui_pixel_size*face_size, 0, c_white, 1);
}