// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_wall_collision(){

var lay_id = layer_get_id("Walls")
var tileset_id = layer_tilemap_get_id(lay_id)
var walls = [tileset_id,obj_wall]

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


}