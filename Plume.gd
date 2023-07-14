extends Particles2D



func _input(event):
	if Input.is_action_pressed("move_up"):
		if get_parent().fuel > 0:
			emitting = true   # This will start the particle system
	else:
		emitting = false
