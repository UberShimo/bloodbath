
function update_steam_achievement(steam_achievement){
	
	// For safety not entirely sure if its neccessary...
	steam_update();
	steam_init();
	steam_update();
	
	if(steam_stats_ready()){
		if(!steam_get_achievement(steam_achievement)){
			steam_set_achievement(steam_achievement);
		}
		steam_update();
	}
}