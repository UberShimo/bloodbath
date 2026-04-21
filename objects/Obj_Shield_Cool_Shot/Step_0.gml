event_inherited();

image_angle -= h_velocity;

// Spawn effect
if(effect_counter >= 1){
	spawn_effect(x, y, 1, Eff_Triangle_Filled, 1, 0.05, c_lime, 0.05, 0.1, 0, 0, 360, 12, depth-1);
}