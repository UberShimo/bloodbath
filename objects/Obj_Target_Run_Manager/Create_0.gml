player_amount = 0;
ui_pixel_size = 1.5;
heart_size = 0.75; // % based
global.game_time = 1; // Just reset time for safety
timer_on = false;
timer_count = 0;
show_final_time = false;

timer_start_alarm = 0;

x_draw_final_time = display_get_gui_width()/2-164;
y_draw_final_time = display_get_gui_height()/2-64;

for(i = 0; i < 8; i++){
	players[i] = noone;
}

p1_ui_hp = 0;
p1_ui_meter = 0;

global_time_reset_alarm = 0;

Obj_Match_Camera.min_screen_size = 800;