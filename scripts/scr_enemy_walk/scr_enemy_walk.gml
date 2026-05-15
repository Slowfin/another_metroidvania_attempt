// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_enemy_walk(){
var lay_id = layer_get_id("Walls")
var tileset_id = layer_tilemap_get_id(lay_id)	
var walls = [tileset_id,obj_wall]
	if !collision_line(x,y,obj_player.x,obj_player.y,walls,false,true) and point_distance(x,y,obj_player.x,obj_player.y) < alert_dis {
		state = states_enemy.alert
		attack_time = 10
	}
	sprite_index = spr_apple
	


// collisions

scr_wall_collision()
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
	state = states_enemy.knockback
	vsp = -4
	attack_time = 90
	if instance_exists(obj_polovnik) {
	hsp = (sp) * obj_polovnik.turn
	}
}

}