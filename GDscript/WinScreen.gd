extends MarginContainer


onready var selection_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Label
onready var selection_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Label


var selection = 0

func _ready():
	set_selection(selection)
	

func _process(delta):
	if self.is_visible() == true:
		if Input.is_action_just_pressed("ui_down") and selection<1:
			selection+=1
			set_selection(selection)
		elif Input.is_action_just_pressed("ui_up") and selection>0:
			selection-=1
			set_selection(selection)
		elif Input.is_action_just_pressed("ui_accept"):
			handle_selection(selection)


func handle_selection(_selection):
	if selection == 0:
		get_parent().get_parent().queue_free()
		get_tree().change_scene("res://Game.tscn")
		get_tree().paused = false
		queue_free()
	elif selection == 1:
		get_tree().quit()
	
		
	


func set_selection(_selection):
	selection_one.text = ""
	selection_two.text = ""
	if selection == 0:
		selection_one.text = ">"
	elif selection == 1:
		selection_two.text = ">"
	
