if(reset_combo && other.is_active){
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
	
	// Update achievements
	if(katana_has_used_clone && hits >= 3){
		update_steam_achievement("KATANA_LEARNED");
	}
	else if(baller_has_recalled_ball && hits >= 3){
		update_steam_achievement("BALLER_LEARNED");
	}
	else if(claws_has_ring_dived && hits >= 3){
		update_steam_achievement("CLAWS_LEARNED");
	}
	else if(knife_has_hit_grenade && hits >= 3){
		update_steam_achievement("KNIFE_LEARNED");
	}
	else if(greatsword_has_hit_pillar && hits >= 3){
		update_steam_achievement("GREATSWORD_LEARNED");
	}
}