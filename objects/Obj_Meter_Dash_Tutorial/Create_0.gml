event_inherited();

text = "Hold RB to channel meter!\n"+
"While channeling meter:\n"+
"LB: METER PULL\n"+
"(Cost 50% meter)\n"+
"LB + direction: METER DASH\n"+
"(Cost 50% meter)\n"+
"\n"+
"METER DASH is\n"+
"INVINCIBLE!\n"+
"METER DASH NOW!!!";
text_scale = 0.6;

alarm[0] = 120;

Obj_Dojo_Manager.student.meter = 50;
Obj_Dojo_Manager.dummy.meter = 0;

Obj_Dojo_Manager.dummy.is_doing_combo_loop = true;
Obj_Dojo_Manager.dummy.alarm[11] = 100;