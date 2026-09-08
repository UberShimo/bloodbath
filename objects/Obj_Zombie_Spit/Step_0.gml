event_inherited();
s = object_scale;
eff = spawn_effect(x, y, 1, Eff_Dot, 0.25, 0, c_red, s, s*2, -s/25, 0, 0, 4, depth+1);
eff.must_be_positive_scale = true;
