hitbox = Obj_Boomhand_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Boomhand_ULTRA_recovery);
air_ok = false;
air_only = false;
info = "Unstoppable super roar that\nstun nearby opponents.";
button_input = Spr_RB_B;
image = Spr_Boomhand_ULTRA_recovery;
frame = 0;
meter_cost = 100;