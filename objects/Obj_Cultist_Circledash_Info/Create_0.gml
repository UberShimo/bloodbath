hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Dash and leave a CIRCLE behind you.\nIf circle touches a STAR\nit implodes. CIRCLE can be\npushed around by attacks.";
movement_input = Spr_Duo_Input;
button_input = Spr_F;
image = Spr_Cultist_Circledash_Forward_recovery;
frame = 0;
extra_image = Spr_Cultist_Circle;
extra_image_color = c_red;
extra_image_x = -24;

is_cancelable = true;