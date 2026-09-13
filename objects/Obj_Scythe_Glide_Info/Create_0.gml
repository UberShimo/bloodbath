hitbox = Obj_Scythe_Glide_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Glide_startup);
recovery = generate_sprite_frames(Spr_Scythe_Glide_recovery);
air_ok = true;
air_only = false;
hold_ok = true;
info = "Glide forward! Consumes a extra jump.\nAngle with LEFT and RIGHT.\nHold to keep gliding.\nDamage depends on speed.";
movement_input = Spr_DF;
button_input = Spr_X;
image = Spr_Scythe_Glide_recovery;
frame = 0;
