// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_player_swim(){
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

// if can't swim can jump out
if !pwr_swim {
	vsp -= 0.08	
}

//  unswim
if !place_meeting(x,y,obj_water) {
	state = states_player.normal
	vsp -= 2
	sp = sp_set
	jumps = 0
	dash_cd = 1
} 
jump_spin = false	
pogo = false

// move lerp
move = (key_right - key_left) * sp
if pwr_swim {
move_v = (key_down - key_up) * sp
} else {
move_v = 0	
}
hsp = (lerp(hsp,move,acceleration_swim) + hsp_force)
vsp = lerp(vsp,move_v,acceleration_swim)

if move != 0 and move_v != 0 {
	sp = sp_set * 0.707	
	dash_sp = dash_sp_set * 0.707	  
} else {
	sp = sp_set
	dash_sp = dash_sp_set
}	



if move_v > 0 {
	if sprite_xscale > 0 {
		sprite_angle = lerp(sprite_angle,-15,0.1)	
	} else {
		sprite_angle = lerp(sprite_angle,15,0.1)
	}
}

if move_v < 0 {
	if sprite_xscale > 0 {
		sprite_angle = lerp(sprite_angle,15,0.1)	
	} else {
		sprite_angle = lerp(sprite_angle,-15,0.1)	
	}
}

if move_v == 0  {
	sprite_angle = lerp(sprite_angle,0,0.1)	 
}

// sprites 
if dash_time > 0 {
	sprite_index = spr_player_dash
} else {
	sprite_index = spr_player_swim
}

// sprite turns
if move > 0 {
	sprite_turn = 1
}	if move < 0 {
	sprite_turn = -1
}

// dash start
if key_dash and dash_time <= 0 and dash_cd <= 0 and pwr_dash and !ride and pwr_swim {
	sprite_xscale = 2 * sprite_turn
	sprite_yscale = 0.8
	dash_time = 7
	hsp = 0
	vsp = 0
	dash_cd = dash_cd_set * 2
	if sprite_turn == 1 {
	dash_turn = 1 * dash_sp_water	
	} else if sprite_turn == -1 {
	dash_turn = -1 * dash_sp_water
	}
	if move > 0 {
	dash_hsp = 1 * dash_sp_water	
	} else if move < 0    {
	dash_hsp = -1 * dash_sp_water	
	} else {
	dash_hsp = 0	
	}
	if move_v > 0 {
	dash_vsp = 1 * dash_sp_water	
	} else if move_v < 0 {
	dash_vsp = -1 * dash_sp_water
	} else {
	dash_vsp = 0	
	}
}
// dash act
if dash_time >= 0 {
	dash_time -= 1
	hsp = dash_hsp
	vsp = dash_vsp
}

if dash_cd > 0 {
	dash_cd -= 1	
}

// hook ride
if place_meeting(x,y,obj_hook_holder) and key_ride and !ride {
	ride = true
	ride_sp = 0
	with obj_hook_holder if place_meeting(x,y,obj_player) {
	other.x = x
	other.y = y
	other.ride_target = pair_obj
	}
}

// ride hook
if ride {
	ride_sp = lerp(ride_sp,3.5,0.02)
	hsp = 0
	vsp = 0  
	x += lengthdir_x(ride_sp,point_direction(x,y,ride_target.x,ride_target.y))
	y += lengthdir_y(ride_sp,point_direction(x,y,ride_target.x,ride_target.y))
	if point_distance(x,y,ride_target.x,ride_target.y) < 2 {
		ride = false	
	}
	// jump while hooking
	if key_jump and !place_meeting(x,y,obj_wall) {		
		if ride_target.x > x {
			ride_target_turn = 1	
		} else {
			ride_target_turn = -1
		}
		hsp_force = (ride_sp * 0.6) * ride_target_turn
		acceleration = 1
		ride = false
		vsp = -wall_jump_power
		jump_time = jump_time_set
	}
} else {
	ride_sp = 0	
	acceleration = 0.2
}

player_heal()
player_attack_ketchup()


if hsp_force != 0 {
	hsp_force = lerp(hsp_force,0,0.1)
}	

if sprite_xscale != 1 or sprite_xscale != -1 {
	sprite_xscale = lerp(sprite_xscale,1*sprite_turn,0.2) 
}
if sprite_yscale != 1 {
	sprite_yscale = lerp(sprite_yscale,1,0.2)
}
}
