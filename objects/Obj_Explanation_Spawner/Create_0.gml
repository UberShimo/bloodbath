y_inc = 32
y_spawn = y+16;

instance_create_depth(x, y_spawn, 0, Obj_Projectile_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Unparryable_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Final_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Cancelable_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Meter_Cost_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Combo_Window_Explanation);
y_spawn += y_inc;
y_spawn += y_inc;
y_spawn += 16;
instance_create_depth(x, y_spawn, 0, Obj_Multi_Button_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Multi_Input_Explanation);
y_spawn += y_inc;

instance_destroy();