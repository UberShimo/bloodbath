/// @description CPU input

if(is_controllable){
	down_hold = false;
	forward_hold = false;
	backward_hold = false;
	light_attack_hold = false;
	medium_attack_hold = false;
	heavy_attack_hold = false;
	meter_hold = false;
	diagonal_input_hold = false;

	reset_buffers();
	
	// Ugly necessary fix for making CPU do special moves the right way
	if(image_xscale > 0){
		right_pressed = buffer_duration;
	}
	else{
		left_pressed = buffer_duration;
	}
	
	// Face opponent
	if(x < closest_enemy.x  && image_xscale < 0){
		backward_hold = true;
	}
	else if(x > closest_enemy.x  && image_xscale > 0){
		backward_hold = true;
	}
	
	if(place_meeting(x, y+2, Obj_Platform) && irandom_range(1, 2) == 1){
		platdrop_pressed = true; // No buffer duration here
		platdrop_hold = true;
	}
	else{
		platdrop_hold = false;
	}

	if(irandom_range(1, 100) <= 50){ // 50% for movement
		rng = irandom_range(1, 4);
	
		if(rng == 1){ // 25% chance to jump
			jump_pressed = buffer_duration;
		}
		else if(rng == 2){ // 33& chance to crouch
			down_hold = true;
		}
	
		rng = irandom_range(1, 10);
	
		if(rng < 6){ // 60% chance to move forward
			forward_hold = true;
		}
		else if(rng < 8){ // 20% chance to move backward
			backward_hold = true;
		}
		alarm[11] = 30;
	}
	else{ // Action
		rng = random_range(0, 1);
	
		if(rng < 0.25){ // 25%
			light_attack_pressed = buffer_duration;
		}
		else if(rng < 0.5){ // 25%
			medium_attack_pressed = buffer_duration;
		}
		else if(rng < 0.75){ // 25%
			heavy_attack_pressed = buffer_duration;
		}
		else if(rng < 1 && action != "ULTRA"){ // 25%
			dash_pressed = 2;
		}
		else{
			// Nothin
		}
		alarm[11] = 8;
	}
}
// Gotta keep the alarm rolling tho
else{
	alarm[11] = 30;
}