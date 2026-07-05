event_inherited();

// Move players
move_amount = h_velocity*logic_time*drag_along_amount;
if(!place_meeting(other.x+move_amount, other.y, Parent_Collision)){
	other.x += move_amount;
}