// If steam controller isnt present
if(!instance_exists(Obj_Steam_Controller)){
	steam_update(); 
}

global.reset_controllers();
global.game_time = 1;

scroller = instance_create_depth(x, y, 0, Obj_Move_Scroller);
scroller.controller_index = global.priority_controller_index;
picker = instance_create_depth(x, y, 0, Obj_Action_Info_Picker);
picker.controller_index = global.priority_controller_index;