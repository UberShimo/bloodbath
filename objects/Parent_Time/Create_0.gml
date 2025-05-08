object_time = 1; // % based
logic_time = 1; // % based
index = -1; // -1 objects belong to noone!
h_velocity = 0;
v_velocity = 0;
general_velocity = 0;
velocity_friction = 0;
shake_amount = 0;
effect_counter = 0; // Fixes so that you spawn less effects when time goes slower

time_reset_alarm = 0;

move_step = function(){
	x += h_velocity*logic_time;
	y += v_velocity*logic_time;
}

snap_to_ground = function(y_margin = 1){
	while(!position_meeting(x, y+y_margin, Parent_Collision) && !position_meeting(x, y+y_margin, Obj_Platform)){
		y += 1;
	}
}