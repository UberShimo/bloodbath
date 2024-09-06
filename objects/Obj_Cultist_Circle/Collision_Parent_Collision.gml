x -= h_velocity;
y -= v_velocity;

// Bounce
if(place_meeting(x+h_velocity, y, Parent_Collision)){
	h_velocity *= -0.8;
	x += h_velocity;
}
if(place_meeting(x, y+v_velocity, Parent_Collision)){
	v_velocity *= -0.8;
	y += v_velocity;
}