event_inherited();

// Reset state
if(action == noone){
	HP = max_HP;
	if(!reset_combo){
		reset_combo = true;
		a_pressed = true;
		
		// Achievement check variables!!!
		katana_has_used_clone = false;
		baller_has_recalled_ball = false;
		claws_has_ring_dived = false;
		knife_has_hit_grenade = false;
		greatsword_has_hit_pillar = false;
	}
}

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	save_current_state();
	
	if(grounded){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		action = "F";
		shake_amount = launcher_shake_amount;
		sprite_index = Spr_Dojo_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(y_pressed){
		action = "L";
		sprite_index = Spr_Dojo_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(b_pressed){
		action = "S";
		sprite_index = Spr_Dojo_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	reset_buffers();
	
	if(doing_action_by_canceling){
		if(action == last_action){
			cancel_the_cancel();
		}
		else{
			do_cancel();
		}
	}
	// Gotta reset this shit
	doing_action_by_canceling = false;
}

// Achievement updates
if(instance_exists(Obj_Dojo_Manager)){
	// Claws
	if(Obj_Dojo_Manager.student.action == "Dive"){
		claws_has_ring_dived = true;
	}
	// Batman
	else if(instance_number(Obj_Batman_Baseball) > 0){
		for(i = 0; i < instance_number(Obj_Batman_Baseball); i++){
			if(instance_find(Obj_Batman_Baseball, i).juggles >= 3){
				update_steam_achievement("BATMAN_LEARNED");
				global.batman_learned = true;
			}
		}
	}
	// Bow
	else if(instance_number(Obj_Bow_Arrow) > 0){
		for(i = 0; i < instance_number(Obj_Bow_Arrow); i++){
			if(instance_find(Obj_Bow_Arrow, i).has_hit_boomerang){
				update_steam_achievement("BOW_LEARNED");
				global.bow_learned = true;
			}
		}
	}
}