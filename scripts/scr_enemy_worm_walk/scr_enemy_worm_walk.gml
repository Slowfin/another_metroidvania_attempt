// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_enemy_worm_walk(){
	
	sprite_index = spr_enemy_worm
	var lay_id = layer_get_id("Walls")
	var tileset_id = layer_tilemap_get_id(lay_id)
	var walls = [tileset_id,obj_wall]
	// collisions
if place_meeting(x+hsp,y,walls) {
	while !place_meeting(x+sign(hsp),y,walls) {
		x += sign(hsp)
	}
	hsp = 0
}	
x += hsp

if place_meeting(x,y+vsp,walls) {
	while !place_meeting(x,y+sign(vsp),walls) {
		y += sign(vsp)
	}
	vsp = 0
}	
y += vsp
vsp += global.grv

hsp = sp * turn
if place_meeting(x + turn,y,walls) {
	turn *= -1
}	

if !place_meeting(x + (turn*10),y+8,walls) {
	turn *= -1
}	

if get_hit {
	prev_state = state	
	state = states_enemy_worm.knockback
	attack_time = 10
	vsp = -1.5
	if instance_exists(obj_polovnik) {
	hsp = 1.5 * obj_polovnik.turn
	}
}

}