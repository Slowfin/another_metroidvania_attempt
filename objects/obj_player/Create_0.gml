enum states_player {
	normal,
	swim
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
grv = 0.3
acceleration = 0.2
acceleration_swim = 0.05
grounded = false
grounded_time = 0


pwr_wall_jump = true
pwr_dash = true

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

attack_cd_set = 10
attack_cd = 0

dash_cd_set = 30
dash_cd = 0
dash_time = 0
dash_sp_set	= 5.5
dash_sp_water = 4
dash_sp	= dash_sp_set
dash_turn = 0
dash_hsp = 0 
dash_vsp = 0

pogo = false
pogo_buffer = 0
pogo_power = 1.3


sprite_xscale = 1
sprite_yscale = 1
sprite_angle = 0
sprite_turn = 1