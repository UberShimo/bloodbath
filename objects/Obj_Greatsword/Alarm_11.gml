event_inherited();

if(is_controllable){
	// Special moves
	rng = random_range(0, 1);

	if(irandom_range(1, 8) == 1){ // 12.5%
		if(irandom_range(0, 1)){ // 50%
			down_forward_pressed = buffer_duration;
		}
		else{
			double_down_pressed = buffer_duration;
		}
		rb_pressed = buffer_duration;
	}
	// Stomp
	else if(rng == 0.1){ // 10%
		double_down_pressed = buffer_duration;
		
		rng = irandom_range(1, 3);
		
		if(rng == 1){
			x_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				x_hold = true;	
			}
		}
		else if(rng == 2){
			y_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				y_hold = true;	
			}
		}
		else if(rng == 3){
			b_pressed = buffer_duration;
			if(irandom_range(0, 1) == 0){ // 50%
				b_hold = true;	
			}
		}
	}
	// Earth stance
	else if(rng < 0.3){ // 20%
		down_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	// Ocean stance
	else if(rng < 0.5){ // 20%
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	// Dunk
	else if(rng < 0.6){ // 10%
		down_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	
	// ULTRA
	if(meter >= 100 && irandom_range(0, 1) == 0){ // 50%
		reset_buffers();
		rb_pressed = buffer_duration;
		half_circle_forward_pressed = buffer_duration;
	}
}