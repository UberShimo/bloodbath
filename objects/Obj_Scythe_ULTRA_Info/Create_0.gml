hitbox = Obj_Scythe_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Scythe_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Scythe_ULTRA_recovery);
air_ok = true;
air_only = false;
info = "Spawn a circle that pulls enemy into it!\nDash to cancel ULTRA.";
button_input = Spr_RB_B;
image = Spr_Scythe_ULTRA_recovery;
frame = 0;
extra_image = Spr_Scythe_ULTRA_projectile;
meter_cost = 100;
