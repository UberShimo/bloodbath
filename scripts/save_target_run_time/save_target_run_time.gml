
function save_target_run_time(){
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
		if(global.katana_TR_record < 10){
			update_steam_achievement("KATANA_TR_10_SEC");
		}
	}
	else if(room == Batman_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.batman_TR_record){
			global.batman_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "batman TR record", global.batman_TR_record);
		}
		if(global.batman_TR_record < 10){
			update_steam_achievement("BATMAN_TR_10_SEC");
		}
	}
	else if(room == Claws_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.claws_TR_record){
			global.claws_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "claws TR record", global.claws_TR_record);
		}
		if(global.claws_TR_record < 10){
			update_steam_achievement("CLAWS_TR_10_SEC");
		}
	}
	else if(room == Baller_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.baller_TR_record){
			global.baller_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "baller TR record", global.baller_TR_record);
		}
		if(global.baller_TR_record < 10){
			update_steam_achievement("BALLER_TR_10_SEC");
		}
	}
	else if(room == Greatsword_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.greatsword_TR_record){
			global.greatsword_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "greatsword TR record", global.greatsword_TR_record);
		}
		if(global.greatsword_TR_record < 10){
			update_steam_achievement("GREATSWORD_TR_10_SEC");
		}
	}
	else if(room == Boomhand_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.boomhand_TR_record){
			global.boomhand_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "boomhand TR record", global.boomhand_TR_record);
		}
		if(global.boomhand_TR_record < 10){
			update_steam_achievement("BOOMHAND_TR_10_SEC");
		}
	}
	else if(room == Bow_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.bow_TR_record){
			global.bow_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "bow TR record", global.bow_TR_record);
		}
		if(global.bow_TR_record < 10){
			update_steam_achievement("BOW_TR_10_SEC");
		}
	}
	else if(room == Cultist_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.cultist_TR_record){
			global.cultist_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "cultist TR record", global.cultist_TR_record);
		}
		if(global.cultist_TR_record < 10){
			update_steam_achievement("CULTIST_TR_10_SEC");
		}
	}
	else if(room == Knife_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.knife_TR_record){
			global.knife_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "knife TR record", global.knife_TR_record);
		}
		if(global.knife_TR_record < 10){
			update_steam_achievement("KNIFE_TR_10_SEC");
		}
	}
	else if(room == Scythe_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.scythe_TR_record){
			global.scythe_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "scythe TR record", global.scythe_TR_record);
		}
		if(global.scythe_TR_record < 10){
			update_steam_achievement("SCYTHE_TR_10_SEC");
		}
	}
	
	ini_close();
}