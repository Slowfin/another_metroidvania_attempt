
switch state {
	case states_enemy_worm.walk: scr_enemy_worm_walk() break
	case states_enemy_worm.knockback: scr_enemy_worm_knockback() break
}

if get_hit {
	hp -= get_damage
	get_hit = false
	alarm[0] = 7
	layer = layer_get_id("Instances_white")
}

if hp <= 0 {
	instance_destroy()	
}

if place_meeting(x,y,obj_player) and obj_player.invincible <= 0{
	obj_player.get_hit = true
	obj_player.source_x = x
	obj_player.source_y = y
}	