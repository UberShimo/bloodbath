event_inherited();

text = "Fall through platform: DOWN + LB\n\n"+
"Reach the flag!";

flag = instance_create_depth(Spawner_P8.x, Spawner_P8.y+64, 5, Obj_Flag);

// Spawn walls
x_spawn = Spawner_P7.x-96;
y_spawn = Spawner_P7.y-64;

// Left walls
for(i = 0; i < 4; i++){
	instance_create_depth(x_spawn, y_spawn, 5, Obj_Wall_Block);
	y_spawn += 32;
}
// Right walls
x_spawn = Spawner_P7.x+64;
y_spawn = Spawner_P7.y-64;
for(i = 0; i < 4; i++){
	instance_create_depth(x_spawn, y_spawn, 5, Obj_Wall_Block);
	y_spawn += 32;
}
// Roof
x_spawn = Spawner_P7.x-64;
y_spawn = Spawner_P7.y-64;
for(i = 0; i < 4; i++){
	instance_create_depth(x_spawn, y_spawn, 5, Obj_Roof_Block);
	x_spawn += 32;
}
