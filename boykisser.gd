extends Node

var drag_offset : Vector2
var dragging := false
var kisses := 0


func _process(delta):
	if dragging == true:
		get_window().position += Vector2i(get_window().get_mouse_position() - drag_offset)

func _on_kiss_button_pressed():
	$Boykisser.frame = 0
	$Boykisser.play("happy")
	kisses += 1
	if (randi()%20)+5 < kisses:
		kisses = 0
		$HeartParticles.restart()
	

func _on_move_button_button_down():
	drag_offset = get_window().get_mouse_position()
	dragging = true


func _on_move_button_button_up():
	dragging = false


func _on_close_button_pressed():
	$Boykisser.play("byebye")


func _on_boykisser_animation_finished():
	if $Boykisser.animation == "byebye":
		get_tree().quit()
