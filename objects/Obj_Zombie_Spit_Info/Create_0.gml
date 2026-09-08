hitbox = Obj_Zombie_Spit;

event_inherited();

air_ok = true;
air_only = false;
info = "Spit 3 acid balls. Hurts :'(";
movement_input = Spr_DF;
button_input = Spr_Y;
image = Spr_Zombie_Spit_recovery;
frame = 0;
extra_image = Spr_Zombie_Spit_ball;
extra_image_x = 12;
extra_image_y = -40;