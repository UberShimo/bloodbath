hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "When close to a pose your DASH\nbecomes special and trigger POSES.\nAlways costs 1 CANCEL.";
movement_input = Spr_Forward;
button_input = Spr_LB;
image = Spr_Shield_Pose_Dash;
frame = 0;

startup = 0;
startup = generate_sprite_frames(Spr_Shield_Pose_Dash);