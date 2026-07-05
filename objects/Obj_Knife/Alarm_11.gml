event_inherited();

	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter moves
	if(meter >= 30 && irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		if(irandom_range(1, 2) == 1){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// Mark dash
	else if(rng < 0.1){ // 10%
		down_forward_pressed = buffer_duration;
		light_attack_pressed = buffer_duration;
	}
	// Mark teleport
	else if(rng < 0.2){ // 10%
		diagonal_input_hold = true;
		light_attack_pressed = buffer_duration;
	}
	// Mark dagger
	else if(rng < 0.4){ // 20&
		down_forward_pressed = buffer_duration;
		medium_attack_pressed = buffer_duration;
	}
	// Mark spin
	else if(rng < 0.55 && !grounded){ // 15%
		diagonal_input_hold = true;
		medium_attack_pressed = buffer_duration;
	}
	// Grenade
	else if(rng < 0.7 && !grounded){ // 15%
		down_forward_pressed = buffer_duration;
		heavy_attack_pressed = buffer_duration;
		
		// Hold?
		if(irandom_range(0, 1)){ // 50%
			heavy_attack_hold = true;
		}
		// Left / right?
		rng = irandom_range(1, 4);
		if(rng == 1){ // 25%
			forward_hold = true;
		}
		else if(rng == 2){ // 25%
			backward_hold = true;
		}
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}