event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 35 && irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		medium_attack_pressed = buffer_duration;
	}
	// Circle
	else if(rng < 0.15){ // 15%
		if(circle != noone){
			double_down_pressed = buffer_duration;
				
			rng = irandom_range(0, 2);
			if(rng == 0){ // 33%
				light_attack_pressed = true;
			}
			else if(rng == 1){ // 33%
				medium_attack_pressed = true;
			}
			else{ // 33%
				heavy_attack_pressed = true;
			}
		}
		else{
			if(irandom_range(0, 1) == 0){ // 50%
				down_forward_pressed = buffer_duration;
			}
			else{
				down_backward_pressed = buffer_duration;
			}
			light_attack_pressed = buffer_duration;
		}
	}
	// Star
	else if(rng < 0.35){ // 20%
		diagonal_input_hold = true;
		
		rng = irandom_range(0, 2)
		if(rng == 1){
			light_attack_pressed = buffer_duration
		}
		else if(rng == 2){
			medium_attack_pressed = buffer_duration
		}
		else{
			heavy_attack_pressed = buffer_duration
		}
	}
	// Blast
	else if(rng < 0.45){ // 10%
		down_forward_pressed = buffer_duration;
		heavy_attack_pressed = buffer_duration
	}
	// Meter teleport
	else if(rng < 0.6 && meter_circle != noone){ // 15%
		meter_hold = true;
		light_attack_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}