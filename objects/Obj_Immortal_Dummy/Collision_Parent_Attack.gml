if(reset_combo && other.is_active){
	hits = 0;
	combo_damage = 0;
	reset_combo = false;
	rapier_stabs = 0;
	rapier_1_sec_countdown = 0;
}

event_inherited();

if(legit_hit_check){
	eff = instance_create_depth(x, y-32, depth-50, Eff_Number);
	eff.number = other.damage;
	eff.v_velocity = -6;

	hits += 1;
	combo_damage += other.damage;
	
	// Rapier stabs cheking
	if(other.object_index == Obj_Rapier_5L_hitbox
	|| other.object_index == Obj_Rapier_6L_hitbox
	|| other.object_index == Obj_Rapier_3L_hitbox
	|| other.object_index == Obj_Rapier_2L_hitbox
	|| other.object_index == Obj_Rapier_8L_hitbox
	|| other.object_index == Obj_Rapier_Lunge_hitbox){
		if(rapier_stabs == 0){
			rapier_1_sec_countdown = 60; // 1 sec
		}
		rapier_stabs += 1;
	}
	
	// Update achievements
	if(katana_has_used_clone && hits >= 3){
		update_steam_achievement("KATANA_LEARNED");
		global.katana_learned = true;
	}
	else if(baller_has_recalled_ball && hits >= 3){
		update_steam_achievement("BALLER_LEARNED");
		global.baller_learned = true;
	}
	else if(claws_has_ring_dived && hits >= 3){
		update_steam_achievement("CLAWS_LEARNED");
		global.claws_learned = true;
	}
	else if(knife_has_hit_grenade && hits >= 3){
		update_steam_achievement("KNIFE_LEARNED");
		global.knife_learned = true;
	}
	else if(greatsword_has_hit_pillar && hits >= 3){
		update_steam_achievement("GREATSWORD_LEARNED");
		global.greatsword_learned = true;
	}
	else if(rapier_1_sec_countdown > 0 && rapier_stabs >= 4){
		update_steam_achievement("RAPIER_LEARNED");
		global.rapier_learned = true;
	}
}

// Achievements!
if(other.object_index = Obj_Boomhand_5S_hitbox){
	if(other.damage >= 120){
		update_steam_achievement("BOOMHAND_LEARNED");
		global.boomhand_learned = true;
	}
}

if(other.object_index = Obj_Knife_Grenade_hitbox){
	Obj_Immortal_Dummy.knife_has_hit_grenade = true;
}

if(other.object_index = Obj_Greatsword_Pillar_hitbox){
	Obj_Immortal_Dummy.greatsword_has_hit_pillar = true;
}