hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Send a clone";
movement_input = Spr_Duo_Input;
button_input = Spr_F;
image = Spr_Katana_Stand;
frame = 0;

is_cancelable = true;
recovery = 24;

extra_image = Spr_Katana_Dash_Forward;
extra_image_x = 64;