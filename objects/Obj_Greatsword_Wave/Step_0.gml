event_inherited();

if(!place_meeting(x, y+1, Parent_Collision) && !place_meeting(x, y+1, Obj_Platform)){
	sprite_index = Spr_Greatsword_Bubble;
	weight = 0.1;
}
else{
	weight = 0;
}