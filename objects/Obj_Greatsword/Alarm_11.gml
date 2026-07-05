event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// Stomp
	else if(rng == 0.1){ // 10%
		diagonal_input_hold = buffer_duration;
		
		rng = irandom_range(1, 3);
		
		if(rng == 1){
			light_attack_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				light_attack_hold = true;	
			}
		}
		else if(rng == 2){
			medium_attack_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				medium_attack_hold = true;	
			}
		}
		else if(rng == 3){
			heavy_attack_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				heavy_attack_hold = true;	
			}
		}
	}
	// Earth stance
	else if(rng < 0.3){ // 20%
		down_forward_pressed = buffer_duration;
		light_attack_pressed = buffer_duration;
	}
	// Ocean stance
	else if(rng < 0.5){ // 20%
		down_forward_pressed = buffer_duration;
		medium_attack_pressed = buffer_duration;
	}
	// Dunk
	else if(rng < 0.6){ // 10%
		down_forward_pressed = buffer_duration;
		heavy_attack_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}