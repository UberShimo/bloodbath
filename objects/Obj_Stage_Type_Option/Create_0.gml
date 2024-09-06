spr_width = sprite_get_width(sprite_index);

gets_picked = function(){
	if(global.arena == Arena_Normal){
		global.arena = Arena_Cage;
	}
	else if(global.arena == Arena_Cage){
		global.arena = Arena_Hole;
	}
	else if(global.arena == Arena_Hole){
		global.arena = Arena_Platform;
	}
	else if(global.arena == Arena_Platform){
		global.arena = Arena_Normal;
	}
}