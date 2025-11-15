if(!global.chaos_mode){
	// P1
	if(instance_exists(p1_ui_instance)){
		p1_ui_hp = p1_ui_instance.HP/p1_ui_instance.max_HP;
		p1_ui_meter = p1_ui_instance.meter/p1_ui_instance.max_meter;
		p1_ui_hearts = p1_ui_instance.hearts;
		p1_ui_face = p1_ui_instance.face;
		p1_ui_face_index = p1_ui_instance.face_index;
		p1_x_ui_meter_shake = random_range(-p1_ui_instance.meter_shake, p1_ui_instance.meter_shake);
		p1_y_ui_meter_shake = random_range(-p1_ui_instance.meter_shake, p1_ui_instance.meter_shake);
	}
	else{
		p1_ui_hp = 0;
		p1_ui_meter = 0;
		p1_ui_hearts = 0;
		p1_x_ui_meter_shake = 0;
		p1_y_ui_meter_shake = 0;
	}
	
	corner_offset = 4*ui_pixel_size;
	x_line = 48*ui_pixel_size+corner_offset;
	y_line = 2*ui_pixel_size+corner_offset;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line, y_line, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line, y_line, ui_pixel_size*p1_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 1,
	x_line + (meter_frame_x + p1_x_ui_meter_shake) * ui_pixel_size,
	y_line + (30 + p1_y_ui_meter_shake) * ui_pixel_size,
	ui_pixel_size*p1_ui_meter, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 0,
	x_line + (meter_frame_x + p1_x_ui_meter_shake) * ui_pixel_size,
	y_line + (30 + p1_y_ui_meter_shake) * ui_pixel_size,
	ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p1_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line+hearts_x*ui_pixel_size+hearts_distance*i*ui_pixel_size*heart_size, y_line+hearts_y*ui_pixel_size, ui_pixel_size*heart_size, ui_pixel_size*heart_size, 0, c_white, 1);
	}
	// Face
	draw_sprite_ext(p1_ui_face, p1_ui_face_index, x_line-22*ui_pixel_size, y_line+22*ui_pixel_size, ui_pixel_size*face_size, ui_pixel_size*face_size, 0, c_white, 1);
	
	// P2
	if(instance_exists(p2_ui_instance)){
		p2_ui_hp = p2_ui_instance.HP/p2_ui_instance.max_HP;
		p2_ui_meter = p2_ui_instance.meter/p2_ui_instance.max_meter;
		p2_ui_hearts = p2_ui_instance.hearts;
		p2_ui_face = p2_ui_instance.face;
		p2_ui_face_index = p2_ui_instance.face_index;
		p2_x_ui_meter_shake = random_range(-p2_ui_instance.meter_shake, p2_ui_instance.meter_shake);
		p2_y_ui_meter_shake = random_range(-p2_ui_instance.meter_shake, p2_ui_instance.meter_shake);
	}
	else{
		p2_ui_hp = 0;
		p2_ui_meter = 0;
		p2_ui_hearts = 0;
		p2_x_ui_meter_shake = 0;
		p2_y_ui_meter_shake = 0;
	}
	
	x_line = display_get_gui_width()-48*ui_pixel_size-corner_offset;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line-2*ui_pixel_size, y_line, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line-2*ui_pixel_size, y_line, -ui_pixel_size*p2_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 1,
	x_line - (meter_frame_x + p2_x_ui_meter_shake) * ui_pixel_size,
	y_line + (30 + p2_y_ui_meter_shake) * ui_pixel_size,
	-ui_pixel_size*p2_ui_meter, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 0,
	x_line - (meter_frame_x + p2_x_ui_meter_shake) * ui_pixel_size,
	y_line + (30 + p2_y_ui_meter_shake) * ui_pixel_size,
	-ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p2_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line-hearts_x*ui_pixel_size-hearts_distance*i*ui_pixel_size*heart_size, y_line+hearts_y*ui_pixel_size, ui_pixel_size*heart_size, ui_pixel_size*heart_size, 0, c_white, 1);
	}
	// Face
	draw_sprite_ext(p2_ui_face, p2_ui_face_index, x_line+22*ui_pixel_size, y_line+22*ui_pixel_size, -ui_pixel_size*face_size, ui_pixel_size*face_size, 0, c_white, 1);
}

// Play winner animation...
if(play_winner_animation){
	scale = 1.6;
	draw_sprite_ext(Spr_Winner, winner_image, x_screen_center, y_screen_center, ui_pixel_size*scale, ui_pixel_size*scale, 0, c_white, 1);
}
if(play_winner_splash){
	scale = 1.8;
	draw_sprite_ext(Spr_Winner_Effect, winner_splash_image, x_screen_center, y_screen_center, ui_pixel_size*scale, ui_pixel_size*scale, 0, winner_color, 1);
}