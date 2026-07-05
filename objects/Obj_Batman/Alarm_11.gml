event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Super ball
	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				light_attack_hold = true;
			}
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
		
	}
	// Pitch ball
	else if(rng < 0.1){ // 10%
		if(irandom_range(0, 1)){ // 50%
			diagonal_input_hold = true;
		}
		else{
			diagonal_input_hold = true;
		}
		light_attack_pressed = buffer_duration;
		if(irandom_range(0, 1) == 0){ // 50%
			light_attack_hold = true;
		}
	}
	// Spinhop
	else if(rng < 0.2){ // 10%
		down_forward_pressed = buffer_duration;
		medium_attack_pressed = buffer_duration;
	}
	// Dropkick
	else if(rng < 0.3){ // 10%
		down_forward_pressed = buffer_duration;
		heavy_attack_pressed = buffer_duration;
	}
	// Headbutt
	else if(rng < 0.4){ // 10%
		diagonal_input_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}