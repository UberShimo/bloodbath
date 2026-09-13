hitbox = Obj_Batman_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Batman_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Batman_ULTRA_recovery);
air_ok = true;
air_only = false;
info = "Tip destroys whatever it touches.\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Batman_ULTRA_recovery;
frame = 0;
meter_cost = 100;