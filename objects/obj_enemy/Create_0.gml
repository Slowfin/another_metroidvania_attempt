randomise()

enum states_enemy {
	walk,
	alert,
	knockback
}

state = states_enemy.walk

hsp = 0  
vsp = 0
get_hit = false
get_damage = 0
hp = 25
alert_dis = 100
turn = 1
sp = 0.6
attack_time = 0
angle = 0
prev_state = 0
can_get_hit = true	

id_name = room_get_name(room) + "_" + string(object_get_name(object_index)) + "_" + string(obj_id)

if global.temp_enemies_killed[$ id_name] == true {
	instance_destroy()	
}
