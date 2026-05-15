enum states_player {
	normal,
	swim,
	knockback,
	heal,
	attack_ketchup
}

state = states_player.normal

objmove = 0
hsp = 0
hsp_force = 0
vsp = 0
move = 0
move_v = 0
sp_set = 1.5
sp = sp_set
global.grv = 0.3
acceleration = 0.2
acceleration_swim = 0.05
grounded = false
grounded_time = 0
cant_move = false

ketchup = 0
ketchup_max = 5
cash = 0

max_hp = 5
hp = max_hp
heal_time_set = 60
heal_time = 0
damage = 7
get_hit = false
invincible_set = 90
invincible = 0

pwr_wall_jump = false
pwr_dash = false
pwr_double_jump = false
pwr_ride = false
pwr_swim =  false
pwr_ketchup_attack = false

jump_power = 3.7
jump_extend = 0.375
jump_time_set = 7
jump_time = 0
jump_buffer = 0
jump_coyot = 0
jumps_max = 2
jumps = 0
jump_spin = false

wall_jump = 0
wall_jump_sp = 5
wall_jump_dir = 0
wall_jump_power = 2.2

ride = false
ride_target = noone

dash_cd_set = 30
dash_cd = 0
dash_time = 0
dash_sp_set	= 5.5
dash_sp_water = 4
dash_sp	= dash_sp_set
dash_turn = 0
dash_hsp = 0 
dash_vsp = 0

attack = false
attack_cd_set = 20
attack_cd = 0
attack_time_set = 40
attack_time = 0

pogo = false
pogo_buffer = 0
pogo_power = 1.3
source_x = 0
source_y = 0
knockback_time = 0


sprite_xscale = 1
sprite_yscale = 1
sprite_angle = 0
sprite_turn = 1

// heal
function player_heal() {
	if ketchup >= 5 and key_heal and !cant_move and !ride {
	ketchup = 0
	if state != states_player.knockback {
	prev_state = state
	} else {
	prev_state = states_player.normal
	} 
	state = states_player.heal
	heal_time = heal_time_set
	sprite_angle = 0
	knockback_time = 2
	_x = x
	_y = y
	audio_play_sound(snd_heal_start,1,0,1,0,random_range(0.9,1.1))
	instance_create_layer(x,y-16,"Game_lower",obj_heal_bar)
}
}

function player_attack_ketchup()  {
	if ketchup >= 2 and key_attack_ketchup and pwr_ketchup_attack and !ride {
	ketchup -= 2
	if state != states_player.knockback {
		prev_state = state
	} else {
		prev_state = states_player.normal	
	}
	knockback_time = 0
	state = states_player.attack_ketchup
	attack_time = attack_time_set 
	image_index = 0
	alarm[3] = 10
}	
}