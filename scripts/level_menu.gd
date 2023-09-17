extends Control

@export var grid : GridContainer

var buttons : Array

func _ready() -> void:
	for i in range(1,51):
		var btn : Button = Button.new()
		buttons.append(btn)
		btn.text = str(i)
		btn.custom_minimum_size.x = 60
		btn.custom_minimum_size.y = 60
		grid.add_child(btn)
		btn.pressed.connect(_lvlbtn_pressed.bind(i))

func _on_back_btn_pressed() -> void:
	Root.sndplay()
	Root.focusBTN.emit()
	queue_free()
		

func _lvlbtn_pressed(i)->void:
	Root.currect_level = i
	if get_tree().change_scene_to_file("res://scens/LVLS/lvl"+str(i)+".tscn") == OK:
		return
