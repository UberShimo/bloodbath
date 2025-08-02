hitbox = Obj_Baller_Ball_Explosion_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Recall ball immediately.";
movement_input = Spr_DD;
button_input = Spr_M;
image = Spr_Baller_Ball;
extra_image = Spr_Baller_Balldash_eff;
extra_image_color = c_lime;
extra_image_scale = -1;
frame = 0;
meter_cost = 40;

is_final = true;