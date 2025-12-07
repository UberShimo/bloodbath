event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	// Super ball
	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			x_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				x_hold = true;
			}
		}
		else{
			y_pressed = buffer_duration;
		}
		
	}
	// Pitch ball
	else if(rng < 0.1){ // 10%
		if(irandom_range(0, 1)){ // 50%
			down_forward_pressed = buffer_duration;
		}
		else{
			double_down_pressed = buffer_duration;
		}
		x_pressed = buffer_duration;
		if(irandom_range(0, 1) == 0){ // 50%
			x_hold = true;
		}
	}
	// Spinhop
	else if(rng < 0.2){ // 10%
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Dropkick
	else if(rng < 0.3){ // 10%
		down_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	// Headbutt
	else if(rng < 0.4){ // 10%
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