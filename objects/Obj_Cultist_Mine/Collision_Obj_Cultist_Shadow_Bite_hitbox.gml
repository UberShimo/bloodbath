star1 = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
star1.shadow_initiate(other);
star1.h_velocity = 0;
star1.v_velocity = -2;
star1.v_acc = 0.01;
star2 = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
star2.shadow_initiate(other);
star2.h_velocity = 0.4;
star2.v_velocity = -1.8;
star2.v_acc = 0.01;
star3 = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
star3.shadow_initiate(other);
star3.h_velocity = -0.4;
star3.v_velocity = -1.8;
star3.v_acc = 0.01;

instance_destroy();