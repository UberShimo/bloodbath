hitbox = Obj_Scythe_Glide_hitbox;

event_inherited();

air_ok = true;
air_only = false;
hold_ok = true;
info = "Glide forward!\nAngle with LEFT and RIGHT.\nHold to keep gliding.\nDamage depends on speed.";
movement_input = Spr_DF;
button_input = Spr_F;
image = Spr_Scythe_Glide_recovery;
frame = 0;

recovery = 0;