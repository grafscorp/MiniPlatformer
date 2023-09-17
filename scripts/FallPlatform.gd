extends StaticBody2D


@export var time_sec : float =1.0
@export var relife_sec : float = 5.0

@export var timer : Timer
@export var anim : AnimatedSprite2D

@export var collision1 : CollisionShape2D
@export var collision2 : CollisionShape2D
var mode : bool = true

func _ready() -> void:
	anim.play("on")
	timer.wait_time = time_sec
	mode = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if !(body is player): return
	timer.wait_time = time_sec
	timer.start()
	mode = true
	



func _on_timer_timeout() -> void:
	if mode:
		Turn(false)
		timer.wait_time = relife_sec
		timer.start()
	else:
		Turn(true)
		
		
func Turn(_state:bool)->void:
	visible = _state
	collision1.disabled = !_state
	collision2.disabled = !_state
	mode = _state
