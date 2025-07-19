player_amount = 0;
ui_pixel_size = 1.5;
heart_size = 0.75; // % based
global.game_time = 1; // Just reset time for safety
play_winner_animation = false;
winner_image = 0;
winner_animation_speed = 0.25;
play_winner_splash = false;
winner_splash_image = 0;
winner_color = c_white;

x_screen_center = display_get_gui_width()/2;
y_screen_center = display_get_gui_height()/2-96;

for(i = 0; i < 8; i++){
	players[i] = noone;
}

p1_ui_hp = 0;
p1_ui_meter = 0;
p1_ui_hearts = 0;
p2_ui_hp = 0;
p2_ui_meter = 0;
p2_ui_hearts = 0;

global_time_reset_alarm = 0;

// Methods
// Kinda complicated actually...
check_for_winner = function(){
	// Get rid of loser
	for(i = 0; i < player_amount; i++){
		if(players[i].hearts <= 0){
			instance_destroy(players[i]);
			player_amount -= 1;
				
			if(i != player_amount){
				for(j = i; j < player_amount; j++){
					players[j] = players[j+1];
				}
			}
		}
	}
	// Check for winning team
	team_win_found = false;
	if(global.teams_mode){
		team_win_found = true;
		index_to_check = players[0].index;
		for(i = 0; i < player_amount; i++){
			if(players[i].index != index_to_check){
				team_win_found = false;
			}
		}
	}
	// Got a winner!!!
	if(player_amount == 1 || team_win_found){
		winner_color = global.p_colors[players[0].index];
		play_music(Snd_NOTHING, 0, 1000);
		audio_play_sound(Snd_Victory, 0, false);
		// Play winner animation alarm
		alarm[10] = 60;
		// Menu alarm
		alarm[11] = 360;
	}
}
