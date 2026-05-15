// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_player_knockback(){
	
	ride = false
	audio_stop_sound(snd_ride)
	sprite_angle = choose(-6,6)
	sprite_xscale = 1
	sprite_yscale = 1
	
// collisions
var lay_id = layer_get_id("Walls")
var tileset_id = layer_tilemap_get_id(lay_id)
var walls = [tileset_id,obj_wall]
scr_wall_collision()
vsp += global.grv 

// swim 
if place_meeting(x,y,obj_water) {
	state = states_player.swim	
	dash_cd = 30
	jumps = 0
	sprite_angle = angle_difference(sprite_angle,0)
	if pwr_swim {
	vsp /= 3
	} else {
	vsp = 1
	}
} 


player_heal()
player_attack_ketchup()


vsp = clamp(vsp,-400,6)
knockback_time -= 1

sprite_index = spr_player_hit
// sprite turns

if knockback_time <= 0 or place_meeting(x,y+1,walls) {
	state = prev_state	
	sprite_angle = 0
	knockback_time = 0
}

}

