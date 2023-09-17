extends CanvasLayer

@export var nextBTN : TextureButton

func _ready() -> void:
	get_tree().paused = true
	nextBTN.grab_focus()
func _on_next_lvl_pressed() -> void:
	Root.sndplay()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scens/LVLS/lvl"+ str(Root.currect_level+1)+ ".tscn")
func _on_quit_pressed() -> void:
	Root.sndplay()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scens/ui/main_menu.tscn")
