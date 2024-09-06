event_inherited();

connection = noone;

clicked = function(clicker){
	if(global.is_CPU[index]){
		global.is_CPU[index] = false;
		clicker.cpu_index = -1;
		clicker.is_picking_for_cpu = false;
		clicker.connection = noone;
		connection = noone;
	}
	else{
		clicker.cpu_index = index;
		clicker.is_picking_for_cpu = true;
		clicker.connection = self;
		connection = clicker;
	}
}