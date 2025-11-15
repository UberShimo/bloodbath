event_inherited();

text = "Hold RB + Press LB to METER DASH!\n"+
"Can be done ANY TIME\n"+
"but cost 50% meter.";

alarm[0] = 120;

Obj_Dojo_Manager.student.meter = 50;

Obj_Dojo_Manager.dummy.is_doing_F_loop = true;
Obj_Dojo_Manager.dummy.alarm[11] = 100;