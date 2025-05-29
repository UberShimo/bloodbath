if(is_collidable && other.is_collidable && !other.is_respawning && !is_in_wall && action != "Stunned"){ // Collision while stunned leads to clippping through walls
	width_check = character_width/2;
	// Left side
	if(x < other.x && x > other.x-width_check && h_velocity > 0){
		if(x-character_push_away_amount < other.x-width_check){
			x = other.x-width_check;
		}
		else{
			x -= character_push_away_amount;
		}
	}
	// Right side
	else if(x > other.x && x < other.x+width_check && h_velocity < 0){
		if(x+character_push_away_amount >  other.x+width_check){
			x = other.x+width_check;
		}
		else{
			x += character_push_away_amount;
		}
	}
}