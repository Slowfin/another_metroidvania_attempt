// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_enemy_knockback(){
	
	sprite_index = spr_apple_hit
	angle += 5 * turn
	
	// collisions
if place_meeting(x+hsp,y,obj_wall) {
	while !place_meeting(x+sign(hsp),y,obj_wall) {
		x += sign(hsp)
	}
	hsp *= -1
}	
x += hsp

if place_meeting(x,y+vsp,obj_wall) {
	while !place_meeting(x,y+sign(vsp),obj_wall) {
		y += sign(vsp)
	}
	vsp = 0
}	
y += vsp
vsp += global.grv

if place_meeting(x + turn,y,obj_wall) {
	turn *= -1
}	


if get_hit {
	prev_state = states_enemy.alert
	state = states_enemy.knockback
	vsp = -4
	attack_time = 90
	if instance_exists(obj_polovnik) {
	hsp = (sp) * obj_polovnik.turn
	}
}


attack_time -= 1

if place_meeting(x,y+1,obj_wall) or attack_time <= 0 {
	state = prev_state
	attack_time = random_range(10,30)
	angle = 0
}

}