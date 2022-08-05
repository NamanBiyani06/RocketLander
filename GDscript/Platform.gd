extends Node2D


func _on_player_detector_body_entered(body):
	var velocity = body.linear_velocity.length()
	print(velocity)
	if (velocity > 100 or velocity < 8) and body.name != ("Rigid"):
		#print(body.name)
		print("Died on platform RIP")
		body.player_death()
		#print(velocity) 
	if body.name == ("Rocket") and velocity < 0.1 and velocity > -0.1:
		win_message()
		#print("velocity" + body.linear_velocity.length()) 
		
func win_message():
	print("You win!")

func _on_Instant_Kill_body_entered(body):
	if body.name == ("Rocket"):
		body.player_death()


