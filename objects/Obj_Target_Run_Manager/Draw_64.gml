
if(instance_exists(players[0])){
	p1_ui_hp = players[0].HP/players[0].max_HP;
	p1_ui_meter = players[0].meter/players[0].max_meter;
}
	
corner_offset = 4*ui_pixel_size;
x_line = 32*ui_pixel_size+corner_offset;
// HP frame
draw_sprite_ext(Spr_HP_Bar, 0, x_line, 2*ui_pixel_size+corner_offset, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
draw_sprite_ext(Spr_HP_Bar, 1, x_line, 2*ui_pixel_size+corner_offset, ui_pixel_size*p1_ui_hp, ui_pixel_size, 0, c_white, 1);
// Meter frame
draw_sprite_ext(Spr_Meter_Bar, 1, x_line, 34*ui_pixel_size+corner_offset, ui_pixel_size*p1_ui_meter, ui_pixel_size, 0, c_white, 1);
draw_sprite_ext(Spr_Meter_Bar, 0, x_line, 34*ui_pixel_size+corner_offset, ui_pixel_size, ui_pixel_size, 0, c_white, 1);

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