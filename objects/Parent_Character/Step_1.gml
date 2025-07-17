// Always make sure there is a closest enemy before executing code
find_closest_enemy();

/// @description Input etc
if(!is_CPU){
	read_input();
}

// Check if stuck in wall kinda
if(collision_rectangle(x-character_width/2, y-character_height/2, x+character_width/2, y+character_height/2, Parent_Collision, false, false) && !goes_through_collision){
	is_in_wall = true;
	colliding_wall = instance_nearest(x, y, Parent_Collision);
}
else{
	is_in_wall = false;
	colliding_wall = noone;
}
