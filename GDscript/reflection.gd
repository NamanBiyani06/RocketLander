tool
extends Sprite

func _process(delta):
	zoom_changed()
	
func zoom_changed():
	material.set_shader_param("y_zoom", get_viewport().global_canvas_transform.y.y)
	
func _on_reflection_item_rect_changed():
	material.set_shader_param("scale", scale)


