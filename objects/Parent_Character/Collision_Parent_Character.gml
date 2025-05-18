if(is_collidable && other.is_collidable && !is_in_wall && action != "Stunned"){ // Collision while stunned leads to clippping through walls
	width_check = character_width/2;
	// Left side
	if(x < other.x && x > other.x-width_check && h_velocity > 0){
		x = other.x-width_check;
	}
	// Right side
	else if(x > other.x && x < other.x+width_check && h_velocity < 0){
		x = other.x+width_check;
	}
}