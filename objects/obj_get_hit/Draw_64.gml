draw_sprite_ext(sprite_index,image_index,0,0,4,4,0,image_blend,image_alpha)
if image_alpha > 0 {
	image_alpha = lerp(image_alpha,0,0.08)	
}