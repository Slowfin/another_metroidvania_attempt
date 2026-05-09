// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_player_attack_ketchup(){
	
	ride = false
	audio_stop_sound(snd_ride)
	sprite_angle = 0
	sprite_xscale = sprite_turn
	sprite_yscale = 1
	
// collisions
if place_meeting(x+hsp,y,obj_wall) {
	while !place_meeting(x+sign(hsp),y,obj_wall) {
		x += sign(hsp)
	}
	hsp = 0
}	
x += hsp
hsp = lerp(hsp,0,0.1)

if place_meeting(x,y+vsp,obj_wall) {
	while !place_meeting(x,y+sign(vsp),obj_wall) {
		y += sign(vsp)
	}
	vsp = 0
}	
y += vsp
vsp += global.grv 

hsp = 0
vsp = 0



vsp = clamp(vsp,-400,6)

sprite_index = spr_player_attack_ketchup
image_index = clamp(image_index,0,image_number-1)
// sprite turns

attack_time -= 1

if attack_time <= 0 {
	state = prev_state
}

}

