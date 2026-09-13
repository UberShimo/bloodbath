hitbox = Obj_Zombie_Arm_Rip_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Zombie_Arm_Rip_startup);
recovery = generate_sprite_frames(Spr_Zombie_Arm_Rip_recovery);
air_ok = true;
air_only = false;
info = "Rip your arm to strike.\nHurts ALOT >:'(";
movement_input = Spr_Diagonal_Input;
button_input = Spr_B;
image = Spr_Zombie_Arm_Rip_recovery;
frame = 0;