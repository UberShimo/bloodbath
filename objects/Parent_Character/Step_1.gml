/// @description Input etc
if(!is_CPU && is_controllable){
	read_input();
}

// Check if stuck in wall kinda
if(collision_rectangle(x-character_width/2, y-character_height/2, x+character_width/2, y+character_height/2, Parent_Collision, false, false) && !goes_through_collision){
	is_in_wall = true;
	colliding_wall = collision_rectangle(x-character_width/2, y-character_height/2, x+character_width/2, y+character_height/2, Parent_Collision, false, false);
}
else{
	is_in_wall = false;
	colliding_wall = noone;
}