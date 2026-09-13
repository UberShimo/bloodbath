hitbox = Obj_Shield_ULTRA_hitbox2;

event_inherited();

startup = generate_sprite_frames(Spr_Shield_ULTRA_startup);
recovery = generate_sprite_frames(Spr_Shield_ULTRA_whiff);
air_ok = true;
air_only = false;
hold_ok = false;
info = "A mighty grab that just...\nKills whatever is squeezes.\nDash to cancel ULTRA.";
movement_input = Spr_EMPTY;
button_input = Spr_RB_B;
image = Spr_Shield_ULTRA_hit;
frame = 1;

meter_cost = 100;