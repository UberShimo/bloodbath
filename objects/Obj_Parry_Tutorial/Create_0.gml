event_inherited();

text = "Parry: LB and NO direction\nTry to parry an attack!";

parry_success = false;
spr_width = sprite_get_width(sprite_index);
spr_height = sprite_get_width(sprite_index);

Obj_Dojo_Manager.dummy.alarm[11] = 60;
Obj_Dojo_Manager.dummy.is_dumbly_attacking = true;