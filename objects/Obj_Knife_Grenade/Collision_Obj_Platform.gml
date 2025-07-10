if(v_velocity > 0 && y < other.y){ // Bounce
	if(place_meeting(x, y+v_velocity, Obj_Platform)){
		v_velocity *= -1;
		// Stop if velocity is super low
		if(get_velocity() < 1){
			h_velocity = 0;
			v_velocity = 0;
		}
	}
	// Reduce velocity
	h_velocity *= 0.4;
	v_velocity *= 0.4;
}