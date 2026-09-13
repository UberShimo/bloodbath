hitbox = Obj_Baller_Ball_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Baller_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Baller_8S_recovery); // 100% informational not used in logic
air_ok = false;
air_only = true;
info = "Throw BALL down if you have it.";
movement_input = Spr_EMPTY;
button_input = Spr_B;
image = Spr_Baller_8S_recovery;
extra_image = Spr_Baller_Ball;
extra_image_x = 8;
extra_image_y = 32;
frame = 0;

is_final = true;