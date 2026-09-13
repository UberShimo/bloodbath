hitbox = Obj_Greatsword_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Greatsword_ULTRA_recovery);
air_ok = false;
air_only = false;
hold_ok = true;
info = "Slam hard like hell!.\nHold to delay slam.\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Greatsword_ULTRA_recovery;
frame = 1;
meter_cost = 100;