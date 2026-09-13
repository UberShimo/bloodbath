hitbox = Obj_Katana_Sweep_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Katana_Sweep_startup);
recovery = generate_sprite_frames(Spr_Katana_Sweep_recovery);
air_ok = false;
air_only = false;
info = "Swoosh forward with a sweep.";
movement_input = Spr_DF;
button_input = Spr_B;
image = Spr_Katana_Sweep_recovery;
frame = 1;