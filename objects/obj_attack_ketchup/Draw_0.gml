draw_self()
if global.show_hitboxes == true {
draw_set_alpha(0.5)
if can_hit {
draw_set_colour(c_blue)
} else {
draw_set_colour(c_grey)	
}
draw_circle(x,y,63.5,0)
draw_set_alpha(1)
}