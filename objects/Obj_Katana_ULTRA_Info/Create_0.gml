hitbox = Obj_Katana_ULTRA_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Unparryable katana slash!\nDash to cancel ULTRA.";
movement_input = Spr_BDF;
button_input = Spr_M;
image = Spr_Katana_ULTRA_recovery;
frame = 0;
meter_cost = 100;
extra_image = Spr_Katana_ULTRA_hit_eff;
extra_image_x = -96;