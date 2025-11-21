event_inherited();

text = "Hold RB to enter charge meter!\n"+
"While charging meter:\n"+
"LB: METER PULL\n"+
"(Cost 75% meter)\n"+
"LB + direction: METER DASH\n"+
"(Cost 50% meter)\n"+
"\n"+
"\n"+
"You can METER DASH anytime.\n"+
"Now METER DASH out of the infinite combo!";
text_scale = 0.6;

alarm[0] = 120;

Obj_Dojo_Manager.student.meter = 50;

Obj_Dojo_Manager.dummy.is_doing_F_loop = true;
Obj_Dojo_Manager.dummy.alarm[11] = 100;