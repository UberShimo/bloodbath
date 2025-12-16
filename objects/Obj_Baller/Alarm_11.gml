event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(meter >= 25 && irandom_range(1, 8) == 1){ // 12.5%
		rb_hold = true;
		if(irandom_range(0, 1)){ // 50%
			x_pressed = buffer_duration;
		}
		else{
			y_pressed = buffer_duration;
		}
	}
	// Drop ball
	else if(rng < 0.1){ // 10%
		double_down_pressed = buffer_duration;
	}
	// Ball dash
	else if(rng < 0.3){ // 20%
		down_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	// Upswing
	else if(rng < 0.45){ // 15%
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Flipkick
	else if(rng < 0.60){ // 15%
		down_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_hold = true;
		b_pressed = buffer_duration;
	}
}