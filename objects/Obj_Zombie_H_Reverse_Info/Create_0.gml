hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Reverse your horizontal momentum.\nCost more meter if done during hitstun.";
button_input = Spr_RB_X;
image = Spr_Zombie_Dash_Backward;
frame = 0;
extra_image = Spr_Whirl;
extra_image_color = c_lime;

meter_cost = 10;
