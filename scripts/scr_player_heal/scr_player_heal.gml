// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_player_heal(){
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

hsp = 0 
vsp = 0

vsp = clamp(vsp,-400,6)

sprite_index = spr_player_heal	

// grounded
if place_meeting(x,y+1,obj_wall) {
	jump_spin = false
	if grounded_time < 5 {
 	grounded_time += 1      
	}
	if grounded_time == 1 {
		dash_cd = 0	
	}
	grounded = true	
	jump_time = jump_time_set
	jump_coyot = 10
	dash_can = true
	jumps = 0
} else {
	grounded = false	
	if wall_jump <= 0 {
	if jumps < 1 {
	jumps = 1	
	} }
	grounded_time = 0
}


attack_cd = 0

if hsp_force != 0 {
	hsp_force = lerp(hsp_force,0,0.1)
}	

if sprite_xscale != 1 or sprite_xscale != -1 {
	sprite_xscale = lerp(sprite_xscale,1*sprite_turn,0.2) 
}
if sprite_yscale != 1 {
	sprite_yscale = lerp(sprite_yscale,1,0.2)
}

heal_time -= 1

if heal_time <= 0 {
	state = prev_state	
	hp += 2
	x = _x
	y = _y
}

var shake_x = choose(-0.5,0.5)
var shake_y = choose(-0.5,0.5)

//x = _x + shake_x
//y = _y + shake_y 

}

