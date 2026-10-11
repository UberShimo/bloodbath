hitbox = Obj_Blank_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Roar_startup);
recovery = generate_sprite_frames(Spr_Boomhand_Roar_recovery);
air_ok = false;
air_only = false;
hold_ok = false;
info = "Roar to gain a fading damage boost!\nStartup is UNSTOPPABLE.";
movement_input = Spr_DD;
button_input = Spr_L;
image = Spr_Boomhand_Roar_recovery;
frame = 2;

is_final = true;