event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter clone
	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		meter_hold = true;
		if(irandom_range(0, 1)){ // 50%
			light_attack_pressed = buffer_duration;
		}
		else{
			medium_attack_pressed = buffer_duration;
		}
	}
	// Send clone
	else if(rng < 0.2){ // 20%
		if(irandom_range(0, 1)){ // 50%
			down_right_pressed = buffer_duration;
		}
		else{
			down_left_pressed = buffer_duration;
		}
		light_attack_pressed = buffer_duration;
	}
	// Quickslash
	else if(rng < 0.35){ // 15%
		if(image_xscale > 0){
			down_right_pressed = buffer_duration;
		}
		else{
			down_left_pressed = buffer_duration;
		}
		medium_attack_pressed = buffer_duration;
	}
	// Sweep
	else if(rng < 0.50){ // 15&
		if(image_xscale > 0){
			down_right_pressed = buffer_duration;
		}
		else{
			down_left_pressed = buffer_duration;
		}
		heavy_attack_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		meter_hold = true;
		heavy_attack_pressed = buffer_duration;
	}
}