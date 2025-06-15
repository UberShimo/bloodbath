event_inherited();

if(legit_hit_check){
	// Effects
	spawn_effect(x, y, 1, Eff_Ring, 1, 0.1, c_white, 0.5, 0.5, 0.2);
	spawn_effect(x, y, 6, Eff_Splash, 1, 0.1, c_white, 1, 2);

	// Gotta remove shake from projectiles for some reason?
	if(other.is_projectile){
		Obj_Match_Camera.shake = 0;
	}
	
	if(instance_exists(Obj_Target_Run_Manager)){
		if(instance_number(Obj_Target) <= 1){
			global.game_time = 0;
			Obj_Target_Run_Manager.alarm[11] = 360;
			Obj_Target_Run_Manager.show_final_time = true;
			Obj_Target_Run_Manager.timer_on = false;
		
			#region save record! If its a record ofc.... Maybe make a method instead?
			ini_open("save.ini");
		
			if(room == Dojo_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.dojo_TR_record){
					global.dojo_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "dojo TR record", global.dojo_TR_record);
				}
			}
			else if(room == Katana_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.katana_TR_record){
					global.katana_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "katana TR record", global.katana_TR_record);
				}
			}
			else if(room == Batman_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.batman_TR_record){
					global.batman_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "batman TR record", global.batman_TR_record);
				}
			}
			else if(room == Claws_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.claws_TR_record){
					global.claws_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "claws TR record", global.claws_TR_record);
				}
			}
			else if(room == Baller_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.baller_TR_record){
					global.baller_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "baller TR record", global.baller_TR_record);
				}
			}
			else if(room == Greatsword_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.greatsword_TR_record){
					global.greatsword_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "greatsword TR record", global.greatsword_TR_record);
				}
			}
			else if(room == Boomhand_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.boomhand_TR_record){
					global.boomhand_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "boomhand TR record", global.boomhand_TR_record);
				}
			}
			else if(room == Bow_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.bow_TR_record){
					global.bow_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "bow TR record", global.bow_TR_record);
				}
			}
			else if(room == Cultist_Target_Run){
				if(Obj_Target_Run_Manager.timer_count < global.cultist_TR_record){
					global.cultist_TR_record = Obj_Target_Run_Manager.timer_count;
					ini_write_real("save", "cultist TR record", global.cultist_TR_record);
				}
			}
			ini_close();
			#endregion
		}
	}
	
	instance_destroy();
}