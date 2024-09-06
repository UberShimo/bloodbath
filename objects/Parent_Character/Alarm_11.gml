/// @description CPU input

if(is_controllable){
	down_hold = false;
	forward_hold = false;
	backward_hold = false;

	reset_buffers();

	if(irandom_range(1, 100) <= 50){ // 50% for movement
		rng = irandom_range(1, 4);
	
		if(rng == 1){ // 25% chance to jump
			a_pressed = buffer_duration;
		}
		else if(rng == 2){ // 33& chance to crouch
			down_hold = true;
		}
	
		rng = irandom_range(1, 10);
	
		if(rng < 6){ // 60% chance to move forward
			forward_hold = true;
		}
		else if(rng < 8){ // 20% chance to move backward
			backward_hold = true;
		}
		alarm[11] = 30;
	}
	else{ // Action
		rng = irandom_range(1, 10);
	
		if(rng == 1){
			x_pressed = buffer_duration;
		}
		else if(rng == 2){
			y_pressed = buffer_duration;
		}
		else if(rng == 3){
			b_pressed = buffer_duration;
		}
		else if(rng == 4){
			lb_pressed = 2;
		}
		else if(rng == 5){
			rb_pressed = 2;
		}
		else{
			// Nothin
		}
		alarm[11] = 8;
	}
}
// Gotta keep the alarm rolling tho
else{
	alarm[11] = 30;
}