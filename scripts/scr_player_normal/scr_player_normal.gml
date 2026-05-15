// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function scr_player_normal(){
// collisions
var lay_id = layer_get_id("Walls")
var tileset_id = layer_tilemap_get_id(lay_id)
var walls = [tileset_id,obj_wall]
scr_wall_collision()
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
// move lerp
if !cant_move {
move = (key_right - key_left) * sp
move_v = (key_down - key_up)
hsp = lerp(hsp,move,acceleration) + hsp_force
if !pogo { 
sp = sp_set
}
}


vsp = clamp(vsp,-400,6)

// sprites 
if ride {
 	sprite_index = spr_player_ride
} else if wall_jump {
	sprite_index = spr_player_climb
} else if dash_time > 0 {
	sprite_index = spr_player_dash
} else if !grounded and jumps >= 2 and pwr_double_jump {
	sprite_index = spr_player_jump_double
} else if !grounded and jumps < 2 {
	sprite_index = spr_player_jump
} else if move != 0 {
	if attack {
	sprite_index = spr_player_run_attack
	} else {
	sprite_index = spr_player_run
	}
} else if attack {
	sprite_index = spr_player_attack
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
if place_meeting(x,y+1,walls) {
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

// jump
if pwr_double_jump {
	jumps_max = 2	
} else {
	jumps_max = 1	
}

jumps = clamp(jumps,0,jumps_max)

if !cant_move {
if ((key_jump or jump_buffer > 0) and grounded) or (jump_coyot > 0 and key_jump and !grounded)
	or (!grounded and key_jump and jumps < jumps_max and pwr_double_jump)  {
	image_index = 0
	vsp = -jump_power
	jump_buffer = 0
	jump_coyot = 0
	if jumps < jumps_max {
	jumps += 1
	}
	sprite_xscale = 1.4 * sprite_turn
	if wall_jump <= 0 {
	if jumps < 2 {
		audio_play_sound(snd_jump,1,0,1,0,random_range(0.9,1.1))
	} else if jumps >= 2 and pwr_double_jump {
		audio_play_sound(snd_jump,1,0,1,0,random_range(1.3,1.5))
	} 	}
	sprite_yscale = 0.8
	if jumps > 1 {
	jump_time = jump_time_set
	} else {
		pogo = false	
	}
} else if key_jump_long and !grounded and jump_time > 0 {
	vsp += -jump_extend
	jump_time -= 1
} else if key_jump_release and !grounded and jump_time > 0 {
	jump_time = 0
} else if key_jump and !grounded and wall_jump <= 0 and !ride {
	jump_buffer = 15
} 
vsp += global.grv
}
if jump_buffer > 0 {
jump_buffer -= 1
} 
if jump_coyot > 0 {
jump_coyot -= 1	
}

// POGO buffer
if !cant_move {
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
}

// jump spin
if jumps > 1 and key_jump and pwr_double_jump {
	jump_spin = true	
} else if grounded or wall_jump or ride {
	jump_spin = false	
}

if jump_spin {
	sprite_angle -= 15 * sprite_turn
} else if !ride {
	sprite_angle = 0  
}

// head bump 
if place_meeting(x,y-1,walls) {
	vsp = 0.5
}

if dash_cd > 0 and !grounded and !place_meeting(x,y,obj_water) {
	dash_cd = 100000	
}

if !cant_move {
// dash start
if key_dash and dash_time <= 0 and dash_cd <= 0 and pwr_dash and !ride {
	image_index = 0
	audio_play_sound(snd_dash,1,0,1,0,random_range(0.9,1.1))
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
}


// wall jump
if !cant_move {
if place_meeting(x+sign((move)*4),y,walls) and pwr_wall_jump and !grounded {
	jump_spin = false
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
	audio_play_sound(snd_jump,1,0,1,0,random_range(0.9,1.1))
	//var psJump = part_system_create(parJump)
	//part_particles_burst(psJump,x,y+8,parJump)
	hsp = (wall_jump_dir * -1) * wall_jump_sp
	vsp = -wall_jump_power
	jump_coyot = 0
	jump_time = jump_time_set
	wall_jump = 0
	dash_can = true
	}
}
	
// hook ride
if !cant_move {
if place_meeting(x,y,obj_hook_holder) and key_ride and !ride and pwr_ride {
	audio_play_sound(snd_ride,1,1)
	image_index = 0
	pogo = false
	ride = true
	ride_sp = 0
	with obj_hook_holder if place_meeting(x,y,obj_player) {
	other.x = x
	other.y = y
	other.ride_target = pair_obj
	sprite_angle = 0
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
		sprite_angle = lerp(sprite_angle,-ride_target_turn*(ride_sp*5),0.1)
		sprite_turn = ride_target_turn
	if point_distance(x,y,ride_target.x,ride_target.y) < 2 {
		audio_play_sound(snd_ride_bump,1,0)	
		ride = false	
		obj_camera.shake_power = 1
		obj_camera.alarm[0] = 5
	}
	// jump while hooking
	if key_jump and !place_meeting(x,y,walls) {	
		hsp_force = (ride_sp * 0.6) * ride_target_turn
		acceleration = 1
		ride = false
		vsp = -wall_jump_power
		jump_time = jump_time_set
		jumps = 1
	}
} else {
	if audio_is_playing(snd_ride) {
	audio_stop_sound(snd_ride)
	}
	ride_sp = 0	
	acceleration = 0.2
}
}

// attack
if !cant_move {
if key_attack and attack == false and attack_cd <= 0 and !ride {
	attack_cd = attack_cd_set
	audio_play_sound(snd_hit,1,0,1,0,random_range(0.85,1.15))	
	if move == 0 {
	image_index = 0
	}
	with instance_create_layer(x,y,"Player",obj_polovnik) {
	}
}
}

if attack_cd > 0 {
	attack_cd -= 1	
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

