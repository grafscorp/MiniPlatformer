extends StaticBody2D

@export var anim : AnimatedSprite2D


var _body : player



func _on_area_2d_body_entered(body: Node2D) -> void:
	_body = body 
	anim.play("jump")
	_body.jump(2)
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if _body == body:
		_body = null


func _on_sprite_animation_finished() -> void:
	anim.play("idle")
	pass
