
switch state {
	case states_enemy.walk: scr_enemy_walk() break
	case states_enemy.alert: scr_enemy_alert() break
	case states_enemy.knockback: scr_enemy_knockback() break
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
	source_x = x
	source_y = y
}	