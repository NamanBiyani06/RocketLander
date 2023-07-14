extends AudioStreamPlayer

func _process(delta):
	if Input.is_action_pressed("move_up"):
		if self.playing == false and get_parent().fuel > 0:
			self.play()
	else:
			 self.playing == false
			
	if Input.is_action_just_released("move_up"):
		self.stop()
