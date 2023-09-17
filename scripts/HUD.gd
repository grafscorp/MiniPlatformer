extends CanvasLayer

@onready var exit_menu = preload("res://scens/ui/quit_menu.tscn")
@onready var reload_menu = preload("res://scens/ui/reload_menu.tscn")
@export var anim1 : AnimatedSprite2D 
@export var anim2 : AnimatedSprite2D 
@export var anim3 : AnimatedSprite2D 
@export var timelbl : Label
@export var Player : player
var heals : Array[AnimatedSprite2D]
var time : int

func _ready() -> void:
	Root.hitPlayer.connect(_update_heal)
	Root.PlayerDie.connect(_player_die)
	heals.append(anim3)
	heals.append(anim2)
	heals.append(anim1)
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape"):
		add_child(exit_menu.instantiate())

func _update_heal()->void:
	for i in heals:
		if i.animation == "default":
			i.play("hit")
			await i.animation_finished
			i.play("empty")
			break
		else:
			continue
func _player_die()->void:
	add_child(reload_menu.instantiate())
	pass


func _on_timer_timeout() -> void:
	time +=1
	timelbl.text = "%02d:%02d" % [time/60,fmod(time,60)] 
	if time/59 >= 60:
		Player.death()
		return
