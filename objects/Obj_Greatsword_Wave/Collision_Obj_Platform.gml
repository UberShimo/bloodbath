if(v_velocity > 0 && y < other.y-16*object_scale){
	while(place_meeting(x, y, other)){
		y -= 1;
	}
	v_velocity = 0;
}