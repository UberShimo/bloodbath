event_inherited();

triangle1_angle += triangle1_rotation;
triangle2_angle += triangle2_rotation;

spawn_alarm -= logic_time;
if(spawn_alarm <= 0){
	zombie = instance_create_depth(x, y, 0, character_to_spawn);
	zombie.index = index;
	zombie.player_color = zombie_color;
	zombie.is_CPU = true;
	zombie.is_controllable = true;
	zombie.alarm[11] = 8;
	zombie.hearts = 1;
	zombie.draw_mini_ui = true;
	zombie.image_alpha = 0.5;
	
	zombie_killer = instance_create_depth(x, y, 0, Obj_Cultist_Zombie_Killer);
	zombie_killer.zombie = zombie;
	instance_destroy();
}