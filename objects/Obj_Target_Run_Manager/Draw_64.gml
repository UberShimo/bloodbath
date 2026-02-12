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

// Draw targets left
draw_sprite_ext(Spr_Target, 0, 800, 48, 2, 2, 0, c_white, 1);
draw_text_transformed(840, 32, " x " + string(instance_number(Obj_Target)), 2, 2, 0);

// Draw timer
part_sec = floor((timer_count%global.FPS)/global.FPS*100);
sec = floor(timer_count/global.FPS);
draw_text_transformed(480, 16, string(sec) + "." + string(part_sec), 3, 3, 0);

if(show_final_time){
	outline_color = c_black;
	outline_size = 8;
	draw_text_transformed_color(x_draw_final_time+outline_size, y_draw_final_time, string(sec) + "." + string(part_sec), 6, 6, 0, outline_color, outline_color, outline_color, outline_color, 1);
	draw_text_transformed_color(x_draw_final_time-outline_size, y_draw_final_time, string(sec) + "." + string(part_sec), 6, 6, 0, outline_color, outline_color, outline_color, outline_color, 1);
	draw_text_transformed_color(x_draw_final_time, y_draw_final_time+outline_size, string(sec) + "." + string(part_sec), 6, 6, 0, outline_color, outline_color, outline_color, outline_color, 1);
	draw_text_transformed_color(x_draw_final_time, y_draw_final_time-outline_size, string(sec) + "." + string(part_sec), 6, 6, 0, outline_color, outline_color, outline_color, outline_color, 1);
	draw_text_transformed(x_draw_final_time, y_draw_final_time, string(sec) + "." + string(part_sec), 6, 6, 0);
	draw_text_transformed(x_draw_final_time, y_draw_final_time, string(sec) + "." + string(part_sec), 6, 6, 0);
}