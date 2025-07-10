// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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
	else if(room == Knife_Target_Run){
		if(Obj_Target_Run_Manager.timer_count < global.knife_TR_record){
			global.knife_TR_record = Obj_Target_Run_Manager.timer_count;
			ini_write_real("save", "knife TR record", global.knife_TR_record);
		}
	}
	
	ini_close();
}