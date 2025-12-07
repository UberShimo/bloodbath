event_inherited();
	
if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Meter clone
	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			x_pressed = buffer_duration;
		}
		else{
			y_pressed = buffer_duration;
		}
	}
	// Send clone
	else if(rng < 0.2){ // 20%
		if(irandom_range(0, 1)){ // 50%
			down_forward_pressed = buffer_duration;
		}
		else{
			down_backward_pressed = buffer_duration;
		}
		x_pressed = buffer_duration;
	}
	// Quickslash
	else if(rng < 0.35){ // 15%
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Sweep
	else if(rng < 0.45){ // 10&
		down_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	// Headsplitter
	else if(rng < 0.55 && !grounded){ // 10%
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