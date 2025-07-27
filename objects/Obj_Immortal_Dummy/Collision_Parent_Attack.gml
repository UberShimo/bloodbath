if(reset_combo){
	hits = 0;
	combo_damage = 0;
	reset_combo = false;
}

event_inherited();

if(legit_hit_check){
	eff = instance_create_depth(x, y-32, depth-50, Eff_Number);
	eff.number = other.damage;
	eff.v_velocity = -6;

	hits += 1;
	combo_damage += other.damage;
}