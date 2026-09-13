hitbox = Obj_Zombie_Bite_hitbox;

event_inherited();

startup = generate_sprite_frames(Spr_Zombie_Bite_startup);
recovery = generate_sprite_frames(Spr_Zombie_Bite_recovery);
air_ok = true;
air_only = false;
info = "Take a bite of your oppoenent\nand heal some.";
movement_input = Spr_DF;
button_input = Spr_B;
image = Spr_Zombie_Bite_recovery;
frame = 0;
meter_cost = 0;
