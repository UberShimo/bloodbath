hitbox = Obj_Greatsword_Ocean_F_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Ocean_F_startup);
recovery = generate_sprite_frames(Spr_Greatsword_Ocean_F_recovery);
air_ok = false;
air_only = false;
info = "During OCEAN stance.";
movement_input = Spr_EMPTY;
button_input = Spr_X;
image = Spr_Greatsword_Ocean_F_recovery;
frame = 1;
extra_image = Spr_Greatsword_Ocean_F_hit_eff;
extra_image_x = 8;