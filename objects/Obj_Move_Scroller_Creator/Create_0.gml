global.reset_controllers();
global.game_time = 1;

scroller = instance_create_depth(x, y, 0, Obj_Move_Scroller);
scroller.controller_index = global.priority_controller_index;