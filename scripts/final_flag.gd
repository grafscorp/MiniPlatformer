extends Area2D

@export var sprite : AnimatedSprite2D
@onready var  win_menu =  preload("res://scens/ui/win_menu.tscn")

var b_active : bool = false

func _on_body_entered(body: Node2D) -> void:
	if b_active: return
	if body is player:
		sprite.play("Flaging")
		b_active = true

func _on_sprite_animation_finished() -> void:
	if sprite.animation == "Flaging":
		sprite.play("Final")
		Root.Win.emit()
		get_tree().paused = true
		Root.currect_level +=1
		add_child(win_menu.instantiate())
		if Root.currect_level < 50:
			Root.currect_level += 1
