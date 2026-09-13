hitbox = Obj_Cultist_Circle_Implosion_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Circle_Pinch_startup);
recovery = generate_sprite_frames(Spr_Cultist_Circle_Pinch_recovery);
air_ok = true;
air_only = false;
info = "Implode CIRCLES after delay.";
movement_input = Spr_DD;
button_input = Spr_Y;
image = Spr_Cultist_Circle_Pinch_recovery;
frame = 0;