randomise()

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

if place_meeting(x,y+1,walls) and vsp_s < 0.01 {
	vsp = vsp_s * 0.5
	vsp_s = vsp_s * 0.5
	angle += (-vsp_s * 20) * -turn
}

if place_meeting(x,y+vsp,walls) {
	while !place_meeting(x,y+sign(vsp),walls) {
		y += sign(vsp)
	}
	vsp = 0
}	
y += vsp


vsp += global.grv
hsp = lerp(hsp,0,sp)
if cant_pickup > 0 {
	cant_pickup -= 1
}	


if place_meeting(x,y,obj_player) and cant_pickup <= 0 {
	obj_player.cash += 1
	audio_stop_sound(snd_coin_collect)
	audio_play_sound(snd_coin_collect,1,0,1,0,random_range(0.8,1.2))
	instance_destroy()
}