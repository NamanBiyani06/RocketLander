extends Control

func _ready():
	$TextureProgress.value = 100
func fuel_UI(fuel):
	$TextureProgress.value = get_node("/Rocket").fuel
