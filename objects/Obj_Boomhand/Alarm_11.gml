event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 15 && irandom_range(1, 20) == 1){ // 5%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// Roar
	else if(rng < 0.10){ // 10%
		double_down_pressed = buffer_duration;
		light_attack_pressed = buffer_duration;
	}
	// Shockwave punch
	else if(rng < 0.15){ // 5%
		diagonal_input_hold = true;
		light_attack_pressed = buffer_duration;
	}
	// Punch move
	else if(rng < 0.25){ // 10%
		down_forward_pressed = buffer_duration;
		medium_attack_pressed = buffer_duration;
	}
	// Groundsmash
	else if(rng < 0.35){ // 10%
		diagonal_input_hold = true;
		medium_attack_pressed = buffer_duration;
	}
	// Burrow
	else if(rng < 0.45){ // 10%
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