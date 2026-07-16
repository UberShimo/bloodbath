event_inherited();

triangle1_angle += triangle1_rotation;
triangle2_angle += triangle2_rotation;

spawn_alarm -= logic_time;
if(spawn_alarm <= 0){
	doppelganger = instance_create_depth(x, y, 0, character_to_spawn);
	doppelganger.index = index;
	doppelganger.player_number = "";
	doppelganger.player_color = doppelganger_color;
	doppelganger.is_CPU = true;
	doppelganger.is_controllable = true;
	doppelganger.alarm[11] = 8;
	doppelganger.hearts = 1;
	doppelganger.draw_mini_ui = true;
	doppelganger.image_alpha = 0.5;
	doppelganger.cant_be_focused = true;
	
	doppelganger_killer = instance_create_depth(x, y, 0, Obj_Cultist_Doppelganger_Killer);
	doppelganger_killer.doppelganger = doppelganger;
	instance_destroy();
}