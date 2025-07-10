hitbox = Obj_Knife_Mark_Dash_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "A dash that MARKS enemy.";
movement_input = Spr_DF;
button_input = Spr_F;
image = Spr_Knife_Mark_Dash_recovery;
frame = 0;

is_cancelable = true;