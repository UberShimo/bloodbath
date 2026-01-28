event_inherited();

triangle1_angle = 0;
triangle2_angle = 180;

triangle1_rotation = 2;
triangle2_rotation = -2;

triangle1_alpha = 0.5;
triangle2_alpha = 0.5;

// One alpha cycle between 2 sec (1/120) and 5 sec (1/300)
triangle1_alpha_change = random_range(1/120, 1/300);
triangle2_alpha_change = -random_range(1/120, 1/300);