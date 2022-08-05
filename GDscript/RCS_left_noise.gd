extends AudioStreamPlayer2D

func _process(delta):
	if Input.is_action_pressed("move_left"):
		if self.playing == false:
			randomize()
			pitch_scale = rand_range(1.6, 2.0)
			self.play()
	else:
			 self.playing == false
			
	if Input.is_action_just_released("move_left"):
		self.stop()
