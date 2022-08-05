extends RigidBody2D

class_name Player

export (int) var engine_thrust
export (int) var spin_thrust

const WinScreen = preload("res://WinScreen.tscn")
const LoseScreen = preload("res://LoseScreen.tscn")

var p_explosion := preload("res://Retro Explosion.tscn")
var gravity = 2
var fuel = 100
var thrust = Vector2()
var rotation_dir = 0
var screen_size = Vector2.ZERO
var pos = Vector2()
var velocity = linear_velocity.length()
var timer = null
var count = 0

func _ready():
	screen_size = get_viewport_rect().size
	
func get_input():
	
		if Input.is_action_pressed("move_up"):
			fuel_usage()
			if fuel > 0:
				thrust = Vector2(engine_thrust, 0).rotated(deg2rad(-90))
		else:
			thrust = Vector2()
		rotation_dir = 0
		if Input.is_action_pressed("move_right"):
			rotation_dir += 1
			
		if Input.is_action_pressed("move_left"):
			rotation_dir -= 1
		
	
	
# warning-ignore:unused_argument
func _process(delta):
		get_input()
		contact_monitor = true
		contacts_reported = 1000
		#editing velocity UI
		get_parent().update_velocity(linear_velocity.length())
		
		

# warning-ignore:unused_argument
func _physics_process(delta):
	set_applied_force(thrust.rotated(rotation))
	set_applied_torque(rotation_dir * spin_thrust)
	
	
		
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if position.x == screen_size.x or position.x == 0:
		player_death()
		print("gone out of X")
	if position.y == screen_size.y or position.y == 0:
		player_death()
		print("Gone out of Y")
	if linear_velocity.length() > -0.1 and linear_velocity.length() < 0.1:
		#print(count)
		if count == 2:
		#yield(get_tree().create_timer(3), "timeout")
			player_win()
		count+=1
	if fuel == 0:
		print("Fuel ran out RIP")

func fuel_usage():
	fuel = fuel - 0.2
	fuel = clamp(fuel, 0, 100)
	get_parent().update_fuel_UI(fuel)

	
func player_death():
	var explode := p_explosion.instance()
	explode.global_position = global_position
	if "Game" in get_parent().name:
		var camera := get_parent().get_node("Camera2D")
		camera.shake(50)
		get_parent().add_child(explode)
	queue_free()
	if "Game" in get_parent().name:
		get_parent().add_child(LoseScreen.instance())
		
	
func player_win():
	get_parent().get_node("CanvasLayer/WinScreen").show()
	get_tree().paused = true
	
	
	


