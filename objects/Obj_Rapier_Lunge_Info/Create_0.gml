hitbox = Obj_Rapier_Lunge_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Lunge forward! Effect depend on input.\nX: Quick but not cancelable.\nY: Normal\nB: Leaves a delayed stab.";
movement_input = Spr_DF;
button_input = Spr_Multi_Button;
image = Spr_Rapier_Lunge_recovery;
frame = 0;