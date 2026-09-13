hitbox = Obj_Scythe_Reap_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_Reap_startup);
recovery = generate_sprite_frames(Spr_Scythe_Reap_recovery);
air_ok = true;
air_only = false;
info = "Tip deals extra damage.";
movement_input = Spr_DF;
button_input = Spr_B;
image = Spr_Scythe_Reap_recovery;
frame = 0;