hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Roar_startup);
recovery = generate_sprite_frames(Spr_Boomhand_Roar_recovery);
air_ok = false;
air_only = false;
info = "Unstoppable roar to increase damage!\nDamage bonus slowly fades away.";
movement_input = Spr_DD;
button_input = Spr_X;
image = Spr_Boomhand_Roar_recovery;
frame = 0;