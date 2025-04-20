event_inherited();

// Special moves
rng = random_range(0, 1);

if(rng < 0.5){ // 50%
	down_forward_pressed = buffer_duration;
	x_pressed = buffer_duration;
}
else if(rng < 0.7){ // 20%
	down_forward_pressed = buffer_duration;
	y_pressed = buffer_duration;
}
else if(rng < 0.8){ // 10%
	down_forward_pressed = buffer_duration;
	b_pressed = buffer_duration;
}