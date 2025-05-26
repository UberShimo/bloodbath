hitbox = Obj_Cultist_Blast_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Create a blast that push\nyourself backwards!";
movement_input = Spr_DF;
button_input = Spr_S;
image = Spr_Cultist_Blast_startup;
frame = 3;
extra_image = Spr_Cultist_Blast_hit_eff;
extra_image_x = 32;