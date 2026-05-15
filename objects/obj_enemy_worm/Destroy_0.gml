hp = 25

if !global.temp_enemies_killed[$ id_name] {
audio_play_sound(snd_enemy_die,1,0,1,0,random_range(0.8,1.1))
if coiny {
	for (var i = 0; i < coin_drop; i++) {
	instance_create_layer(x,y,"Instances",obj_coin)	
	}
}
} 

global.temp_enemies_killed[$ id_name] = true


