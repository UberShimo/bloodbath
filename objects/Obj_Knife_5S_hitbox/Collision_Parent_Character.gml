event_inherited();

// Extra dmg if target is marked
if(other.index != index && !other.is_parrying && other == spawner.marked_target){
	other.HP -= 19;
	spawner.marked_target = noone;
}