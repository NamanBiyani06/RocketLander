extends Node2D

func _ready():
	var fuel_amount = get_node("/root/Game/Rocket/fuel")
	
func _process(delta):
	if Input.is_action_pressed("quit_game"):
		get_tree().quit()
		
		


func update_fuel_UI(value):
	$HUD/ProgressBar.value = value
	$HUD/FuelPercentage.text = String(int(value))

func update_velocity(value):
	$HUD/velocityIndicator.text = String(value)


func _on_Water_body_entered(body):
	if body.name == ("Rocket"):
		body.player_death()
