hitbox = Obj_Rapier_Spin_Back_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Spin rapier and step back.";
movement_input = Spr_Diagonal_Input;
button_input = Spr_B;
image = Spr_Rapier_Spin_Back_recovery;
frame = 0;
extra_image = Spr_Rapier_Spin_Back_hit_eff;