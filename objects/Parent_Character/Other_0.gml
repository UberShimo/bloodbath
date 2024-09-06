HP = 0;
is_invincible = false;
att = instance_create_depth(x, y, 0, Obj_Blank_hitbox);
att.initiate(self);
att.index = -1;