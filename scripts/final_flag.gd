extends Area2D

@export var sprite : AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	if body is player:
		sprite.play("Flaging")

func _on_sprite_animation_finished() -> void:
	if sprite.animation == "Flaging":
		sprite.play("Final")
		Root.Win.emit()
