event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 15 && irandom_range(1, 20) == 1){ // 5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			x_pressed = buffer_duration;
		}
		else{
			y_pressed = buffer_duration;
		}
	}
	// Roar
	else if(rng < 0.15){ // 15%
		half_circle_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	// Groundsmash
	else if(rng < 0.25){ // 10%
		double_down_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	// Punch move
	else if(rng < 0.35){ // 10%
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Ground uppercut
	else if(rng < 0.45){ // 10%
		double_down_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_hold = true;
		b_pressed = buffer_duration;
	}
}