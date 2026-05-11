if !global.walls_broken[$ id_name] {
audio_stop_sound(snd_wall_broken)
audio_play_sound(snd_wall_broken,1,0,1,0,random_range(0.8,1.1))
} 

global.walls_broken[$ id_name] = true