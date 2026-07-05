event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter moves
	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// Flight
	else if(rng < 0.15){ // 15%
		down_forward_pressed = buffer_duration;
		light_attack_pressed = buffer_duration;
	}
	// Birdie
	else if(rng < 0.3){ // 15%
		down_forward_pressed = buffer_duration;
		medium_attack_pressed = buffer_duration;
	}
	// Reap
	else if(rng < 0.45){ // 15&
		down_forward_pressed = buffer_duration;
		heavy_attack_pressed = buffer_duration;
	}
	// Lightning
	else if(rng < 0.60 && grounded){ // 15%
		double_down_pressed = buffer_duration;
		
		rng = irandom_range(0, 2);
		if(rng == 1){ // 33%
			light_attack_pressed = buffer_duration;
		}
		else if(rng == 2){ // 33%
			medium_attack_pressed = buffer_duration;
		}
		else{ // 33%
			heavy_attack_pressed = buffer_duration;
		}
		
		rng = irandom_range(0, 2);
		if(rng == 1){ // 33%
			backward_hold = true;
		}
		else if(rng == 2){ // 33%
			forward_hold = true;
		}
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}