event_inherited();

if(is_controllable){
	// Special moves
	rng = irandom_range(1, 6);

	if(irandom_range(1, 8) == 1){
		down_forward_pressed = buffer_duration;
		rb_pressed = buffer_duration;
	}
	else if(rng == 1){
		rng = irandom_range(1, 3);
		
		if(rng == 1){
			double_down_pressed = buffer_duration;
			x_pressed = buffer_duration;
		}
		else if(rng == 2){
			double_down_pressed = buffer_duration;
			y_pressed = buffer_duration;
		}
		else if(rng == 3){
			double_down_pressed = buffer_duration;
			b_pressed = buffer_duration;
		}
	}
	else if(rng == 2){
		down_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	else if(rng == 3){
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	else if(rng == 4){
		down_backward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	
	if(meter >= 100){
		down_backward_pressed = true;
		half_circle_forward_pressed = true;
	}
}