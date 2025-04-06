hitbox = Obj_Cultist_Circle_Pullback_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Pull CIRCLE to you dealing damage\nto anyone in its path.";
movement_input = Spr_DD;
button_input = Spr_S;
image = Spr_Cultist_Circlepull_recovery;
frame = 0;

extra_image = Spr_Cultist_Circle_Pulled_hit_eff;
extra_image_rotation = 180;
extra_image_color = c_red;