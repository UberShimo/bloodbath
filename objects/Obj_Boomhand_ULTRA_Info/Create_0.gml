hitbox = Obj_Boomhand_ULTRA_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Boomhand_ULTRA_recovery);
air_ok = false;
air_only = false;
info = "Super roar that stun nearby opponents!\nStartup is UNSTOPPABLE.";
button_input = Spr_M_H;
image = Spr_Boomhand_ULTRA_recovery;
frame = 0;
meter_cost = 100;