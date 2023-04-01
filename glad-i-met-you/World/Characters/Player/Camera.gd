extends Camera3D
#capture the mouse and set up ui_cancel (esc)
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # set_mouse_mode function is a member of the Input object.
		#MOUSE_MODE_CAPTURED constant that is a member of the Input object.
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
