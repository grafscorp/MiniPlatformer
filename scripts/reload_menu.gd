extends CanvasLayer
@export var reloadBTN : TextureButton
func _ready() -> void:
	get_tree().paused = true
	reloadBTN.grab_focus()


func _on_quit_pressed() -> void:
	Root.sndplay()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scens/ui/main_menu.tscn")


func _on_reload_pressed() -> void:
	Root.sndplay()
	get_tree().paused = false
	get_tree().reload_current_scene()
	
	pass # Replace with function body.
