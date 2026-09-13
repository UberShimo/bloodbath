hitbox = Obj_Katana_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Katana_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Katana_ULTRA_recovery);
air_ok = true;
air_only = false;
info = "Katana slash!\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Katana_ULTRA_recovery;
frame = 0;
meter_cost = 100;
extra_image = Spr_Katana_ULTRA_hit_eff;
extra_image_x = -96;