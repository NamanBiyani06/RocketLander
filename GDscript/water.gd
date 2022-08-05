extends RigidBody2D

class_name Water
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	contacts_reported = 1000# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func damage():
	$Rocket.queue_free()
	
func _on_Rocket_body_entered(body):
	if body.name.match("Player"):
		print("hit")
		damage()
