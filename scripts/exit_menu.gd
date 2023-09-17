extends Control
class_name exit_menu

@export var quitBTN : TextureButton
func _ready() -> void:
	quitBTN.grab_focus()
	get_tree().paused = true
func _on_texture_button_pressed() -> void:
	get_tree().paused = false
	if Root.mode == Root.MENU_MODE:
		get_tree().quit()
	else:
		Root.sndplay()
		get_tree().change_scene_to_file("res://scens/ui/main_menu.tscn")


func _on_cancel_btn_pressed() -> void:
	cancel()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape"):
		cancel()
	
func cancel()->void:
	get_tree().paused = false
	Root.sndplay()
	queue_free()
	Root.emit_signal("focusBTN")
