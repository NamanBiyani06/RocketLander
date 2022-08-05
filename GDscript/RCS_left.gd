extends Particles2D



func _input(event):
	if Input.is_action_pressed("move_left"):
		emitting = true   # This will start the particle system
	else:
		emitting = false
