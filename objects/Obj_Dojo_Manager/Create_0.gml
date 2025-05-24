event_inherited();

index = -1;
student = noone;
dummy = noone;
time_switch_pressed = false;
reset_positions_pressed = false;
change_debug_pressed = false;

global.BG_index = array_length(global.BG_list)-1; // Trainingroom
play_music(Mu_Tutorial, global.music_volume);

// Methods
// No winning in Dojo!
check_for_winner = function(){
	// Dummy guy has index -1 so gotta do some wierd looping here
	for(i = 0; i < instance_number(Parent_Character); i++){
		obj = instance_find(Parent_Character, i);
		obj.hearts = 2;
	}
}

controller_x = 64;
controller_y = 0;

// Need short delay so stuff can be initiated
alarm[1] = 2;

// Initiate student. First player in list.
for(i = 0; student == noone; i++){
	if(global.picked_characters[i] != noone){
		student = global.picked_characters[i];
	}
}