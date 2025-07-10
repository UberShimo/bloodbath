hitbox = Obj_Claws_Spike_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Rise spikes forward!";
movement_input = Spr_DF;
button_input = Spr_M;
image = Spr_Claws_Spikerise_recovery;
frame = 1;
meter_cost = 20;
extra_image = Spr_Claws_Spike;
extra_image_x = 32;
extra_image_y = 32;

is_final = true;