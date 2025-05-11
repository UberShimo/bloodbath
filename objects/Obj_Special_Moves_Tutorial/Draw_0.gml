event_inherited();

draw_text_transformed(Obj_Blackboard.x+text_x, Obj_Blackboard.y+text_y+64, "Quickly press:\n"+bonus_text, text_scale, text_scale, 0);

// Draw input sprite
draw_sprite(button_spr, 0, x, y+32);
draw_sprite(input_spr, 0, x, y+32);