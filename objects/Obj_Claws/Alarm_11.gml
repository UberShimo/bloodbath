event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// H ring
	else if(rng < 0.1){ // 10%
		if(!instance_exists(ring1)){
			if(irandom_range(0, 1) == 0){
				down_right_pressed = buffer_duration;
			}
			else{
				down_left_pressed = buffer_duration;
			}
		}
		else{
			if(image_xscale > 0){
				right_pressed = buffer_duration;
			}
			else{
				left_pressed = buffer_duration;
			}
			diagonal_input_hold = true;
		}
		light_attack_pressed = buffer_duration;
	}
	// V ring
	else if(rng < 0.2){ // 10%
		if(!instance_exists(ring2)){
			if(irandom_range(0, 1) == 0){
				down_right_pressed = buffer_duration;
			}
			else{
				down_left_pressed = buffer_duration;
			}
		}
		else{
			if(image_xscale > 0){
				right_pressed = buffer_duration;
			}
			else{
				left_pressed = buffer_duration;
			}
			diagonal_input_hold = true;
		}
		medium_attack_pressed = buffer_duration;
	}
	// Penguin / Forced dive
	else if(rng < 0.35){ // 15%
		if(image_xscale > 0){
			right_pressed = buffer_duration;
		}
		else{
			left_pressed = buffer_duration;
		}
		diagonal_input_hold = buffer_duration;
		heavy_attack_pressed = buffer_duration;
	}
	// Backflip!
	else if(rng < 0.5){ // 15%
		if(irandom_range(0, 1) == 0){
			down_right_pressed = buffer_duration;
		}
		else{
			down_left_pressed = buffer_duration;
		}
		heavy_attack_pressed = buffer_duration;
	}
	// Spinneroo
	else if(rng < 0.55){ // 5%
		double_down_pressed = buffer_duration;
		heavy_attack_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}