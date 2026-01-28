event_inherited();

triangle1_angle += triangle1_rotation*logic_time;
triangle2_angle += triangle2_rotation*logic_time;

triangle1_alpha += triangle1_alpha_change;
triangle2_alpha += triangle2_alpha_change;

if(triangle1_alpha >= 1){
	triangle1_alpha_change = -random_range(1/120, 1/300);
}
else if(triangle1_alpha <= 0){
	triangle1_alpha_change = random_range(1/120, 1/300);
}

if(triangle2_alpha >= 1){
	triangle2_alpha_change = -random_range(1/120, 1/300);
}
else if(triangle2_alpha <= 0){
	triangle2_alpha_change = random_range(1/120, 1/300);
}