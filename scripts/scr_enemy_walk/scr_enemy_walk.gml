// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_enemy_walk(){
	
	if !collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,true) and point_distance(x,y,obj_player.x,obj_player.y) < alert_dis {
		state = states_enemy.alert
		attack_time = 10
	}
	sprite_index = spr_apple
	
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

hsp = sp * turn
if place_meeting(x + turn,y,obj_wall) {
	turn *= -1
}	

if !place_meeting(x + (turn*10),y+8,obj_wall) {
	turn *= -1
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