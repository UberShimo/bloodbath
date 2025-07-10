hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Vortex_startup);
recovery = generate_sprite_frames(Spr_Cultist_Vortex_recovery);

air_ok = true;
air_only = false;
info = "Teleport to CIRCLE.";
movement_input = Spr_DD;
button_input = Spr_F;
image = Spr_Cultist_Vortex_startup;
frame = 0;