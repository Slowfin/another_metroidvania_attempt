// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_enemy_alert(){

sprite_index = spr_apple_alert

// collisions
if place_meeting(x+hsp,y,obj_wall) {
	while !place_meeting(x+sign(hsp),y,obj_wall) {
		x += sign(hsp)
	}
	hsp = 0
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

if attack_time > 0 {
	attack_time -= 1	
}

if place_meeting(x,y+1,obj_wall) {
	hsp = 0	
}

if attack_time <= 0 {
	if x < obj_player.x {
		turn = 1	
	} else {
		turn = -1	
	}
	hsp = turn * (sp * 1.5)
	vsp = -5
	image_index = 0
	attack_time = random_range(40,90)
}

if image_index > 8 {
	image_index = 8	
}

if get_hit {
	prev_state = state	
	state = states_enemy.knockback
	vsp = -4
	attack_time = 90
	if instance_exists(obj_polovnik) {
	hsp = (sp) * obj_polovnik.turn
	}
}

}