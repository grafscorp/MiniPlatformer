extends StaticBody2D

@export var anim :  AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("on")
	pass # Replace with function body.



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is player:
		body.damage()
		body.jump(1,true)


func _on_area_2d_mouse_exited() -> void:
	Root.trigger = ""


func _on_area_2d_mouse_entered() -> void:
	Root.trigger = self.name
