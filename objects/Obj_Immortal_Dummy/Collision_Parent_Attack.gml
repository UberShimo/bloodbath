if(action == noone && grounded){
	combo_damage = 0;
}

event_inherited();

if(legit_hit_check){
	eff = instance_create_depth(x, y-32, depth-50, Eff_Number);
	eff.number = other.damage;
	eff.v_velocity = -6;

	combo_damage += other.damage;
}