hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Dash through nearby POSE and\nTRIGGER it!";
movement_input = Spr_EMPTY;
button_input = Spr_RB_X;
image = Spr_Shield_Pose_Dash_recovery;
frame = 0;

meter_cost = 10;
is_cancelable = true;

startup = 0;
startup = generate_sprite_frames(Spr_Shield_Pose_Dash_recovery);