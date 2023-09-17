extends Control

@onready var exit_menu = preload("res://scens/ui/quit_menu.tscn")
@onready var lvlmenu = preload("res://scens/ui/level_menu.tscn")
@export var skin_preview : AnimatedSprite2D
@export var music : AudioStreamPlayer
@export var lvlLavel : Label
@export var playBTN : TextureButton
func  _ready() -> void:
	_update_lvl_label()
	playMusic()
	Root.mode = Root.MENU_MODE
	skin_preview.play(Root.PlayerSkin)
	_fcsBTN()
	Root.focusBTN.connect(_fcsBTN)

func _on_play_btn_pressed() -> void:
	Root.sndplay()
	get_tree().change_scene_to_file("res://scens/LVLS/lvl"+ str(Root.currect_level)+ ".tscn")


func _on_quitbtn_pressed() -> void:
	Root.sndplay()
	add_child(exit_menu.instantiate())


func _on_levels_btn_pressed() -> void:
	Root.sndplay()
	add_child(lvlmenu.instantiate())

func playMusic()->void:
	randomize()
	music.stream = load("res://assets/MusicG/" + str(randi()%28+1) +".mp3")
	music.play()

	

func _on_music_finished() -> void:
	playMusic()


func _on_next_skin_pressed() -> void:
	var i :int = Root.SKINS.find(Root.PlayerSkin)
	if i >= Root.SKINS.size()-1:
		i = 0
	else:
		i+=1
	Root.PlayerSkin = Root.SKINS[i]
	skin_preview.play(Root.PlayerSkin)
	

func _on_back_skin_pressed() -> void:
	var i :int = Root.SKINS.find(Root.PlayerSkin)
	if i <= 0:
		i = Root.SKINS.size()-1
	else:
		i-=1
	Root.PlayerSkin = Root.SKINS[i]
	skin_preview.play(Root.PlayerSkin)

func _update_lvl_label()->void:
	lvlLavel.text = str(Root.currect_level) + " lvl"
	pass

func _fcsBTN()->void:
	playBTN.grab_focus()
