event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter moves
	if(meter >= 20 && irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// Lunge
	else if(rng < 0.25){ // 25%
		rng = irandom_range(0, 2);
		down_forward_pressed = buffer_duration;
		if(rng == 0){ // 33%
			light_attack_pressed = buffer_duration;
		}
		else if(rng == 0){ // 33%
			medium_attack_pressed = buffer_duration;
		}
		else{
			heavy_attack_pressed = buffer_duration;
		}
	}
	// Toe pick
	else if(rng < 0.35){ // 10%
		diagonal_input_hold = true;
		medium_attack_pressed = buffer_duration;
	}
	// Gooch impaler
	else if(rng < 0.40){ // 5%
		down_forward_pressed = buffer_duration;
		medium_attack_pressed = buffer_duration;
	}
	// Back spin
	else if(rng < 0.55 && !grounded){ // 15%
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