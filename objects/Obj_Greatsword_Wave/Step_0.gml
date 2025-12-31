event_inherited();

if(!place_meeting(x, y+1, Parent_Collision) && !position_meeting(x, y+sprite_height/2*object_scale+1, Obj_Platform)){
	sprite_index = Spr_Greatsword_Bubble;
	weight = 0.1;
}
else{
	sprite_index = Spr_Greatsword_Wave;
	weight = 0;
}