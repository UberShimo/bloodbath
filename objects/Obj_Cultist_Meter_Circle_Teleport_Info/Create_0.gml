hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Vortex_startup);
recovery = generate_sprite_frames(Spr_Cultist_Vortex_recovery);

air_ok = true;
air_only = false;
info = "Teleport to green CIRCLE.";
button_input = Spr_RB_X;
image = Spr_Cultist_Vortex_startup;
frame = 1;
