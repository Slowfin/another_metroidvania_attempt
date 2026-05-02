// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_player_normal(){
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

// swim 
if place_meeting(x,y,obj_water) {
	state = states_player.swim	
	dash_cd = 30
	jumps = 0
	sprite_angle = angle_difference(sprite_angle,0)
} 

// move lerp
move = (key_right - key_left) * sp
hsp = lerp(hsp,move,acceleration) + hsp_force
if !pogo { 
sp = sp_set
}


vsp = clamp(vsp,-400,6)

// sprites 
if ride {
 	sprite_index = spr_player_ride
} else if dash_time > 0 {
	sprite_index = spr_player_dash
} else if !grounded and jumps >= 2 {
	sprite_index = spr_player_jump_double
} else if !grounded and jumps < 2 {
	sprite_index = spr_player_jump
} else if move != 0 {
	sprite_index = spr_player_run
} else {
	sprite_index = spr_player	
}
// sprite turns
if !ride {
if move > 0 {
	sprite_turn = 1
}	if move < 0 {
	sprite_turn = -1
} }

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
	if jumps < 1 {
	jumps = 1	
	}
	grounded_time = 0
}

// jump
if ((key_jump or jump_buffer > 0) and grounded) or (jump_coyot > 0 and key_jump and !grounded)
	or (!grounded and key_jump and jumps < jumps_max)  {
	vsp = -jump_power
	jump_buffer = 0
	jump_coyot = 0
	jumps += 1
	sprite_xscale = 1.4 * sprite_turn
	sprite_yscale = 0.8
	pogo = false
	if jumps > 1 {
	jump_time = jump_time_set
	}
} else if key_jump_long and !grounded and jump_time > 0 {
	vsp += -jump_extend
	jump_time -= 1
} else if key_jump_release and !grounded and jump_time > 0 {
	jump_time = 0
} else if key_jump and !grounded and wall_jump <= 0 and !ride {
	jump_buffer = 15
}
vsp += grv
if jump_buffer > 0 {
jump_buffer -= 1
} 
if jump_coyot > 0 {
jump_coyot -= 1	
}

// POGO buffer
if key_pogo and !grounded {
	if pogo_buffer <= 0 {
	pogo_buffer = 15
	} else {
	pogo = false	
	}
// pogo ruin
} else if grounded and !key_pogo and pogo_buffer <= 0 {
	pogo = false
	pogo_power = 1.3
	pogo_buffer = 0
}	
if pogo_buffer > 0 {
	pogo_buffer -= 1	
}
// pogo jump
if ((pogo_buffer > 0) and grounded) {
	sprite_xscale =( 1 *pogo_power) * sprite_turn
	sprite_yscale = 0.8
	pogo = true
	pogo_power  += 0.2
	vsp = -jump_power * pogo_power
	sp *= 1.2
	if move == 0 {
	sp = lerp(sp,sp_set,0.1)	
	}
	sp = clamp(sp,0,3)
	pogo_power = clamp(pogo_power,0,2)
}

// jump spin
if jumps > 1 and key_jump {
	jump_spin = true	
} else if grounded or wall_jump or ride {
	jump_spin = false	
}

if jump_spin {
	sprite_angle -= 15 * sprite_turn
} else {
	sprite_angle = 0  
}

// head bump 
if place_meeting(x,y-1,obj_wall) {
	vsp = 0.5
}

// dash start
if key_dash and dash_time <= 0 and dash_cd <= 0 and dash_can and pwr_dash and !ride {
	sprite_angle = 0
	sprite_xscale = 2 * sprite_turn
	sprite_yscale = 0.8
	jump_spin = false
	dash_time = 10
	hsp = 0
	vsp = 0
	dash_can = false
	if grounded {
		dash_cd = dash_cd_set	
	} else {
		dash_cd = 10000
	} if sprite_turn > 0 {
	dash_hsp = 1 * dash_sp
	} else if sprite_turn < 0    {
	dash_hsp = -1 * dash_sp	
	} 
	dash_vsp = 0
}
// dash act
if dash_time >= 0 {
	dash_time -= 1
	hsp = dash_hsp
	vsp= dash_vsp
}
if dash_cd > 0 {
	dash_cd -= 1	
}


// wall jump
if place_meeting(x+sign((move)*4),y,obj_wall) and pwr_wall_jump and !grounded {
	pogo = false
	wall_jump = 7
	dash_can = true
	dash_cd = 0
	jumps = 0
	wall_jump_dir = sign(move)
} else if wall_jump > 0 {
	wall_jump -= 1	
}

if wall_jump > 0  {
	if vsp > 0.5  {
	vsp = 0.5
	}
}	
		
if wall_jump > 0 and ((key_jump) or (jump_buffer > 0 ))  {
	//var psJump = part_system_create(parJump)
	//part_particles_burst(psJump,x,y+8,parJump)
	hsp = (wall_jump_dir * -1) * wall_jump_sp
	vsp = -wall_jump_power
	jump_coyot = 0
	jump_time = jump_time_set
	wall_jump = 0
	dash_can = true
	}
	
// hook ride
if place_meeting(x,y,obj_hook_holder) and key_ride and !ride {
	pogo = false
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
	if ride_target.x > x {
			ride_target_turn = 1	
		} else {
			ride_target_turn = -1
		}
		sprite_turn = ride_target_turn
	if point_distance(x,y,ride_target.x,ride_target.y) < 2 {
		ride = false	
	}
	// jump while hooking
	if key_jump and !place_meeting(x,y,obj_wall) {	
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

