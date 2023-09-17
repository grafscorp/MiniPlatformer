extends CharacterBody2D
class_name  player

const SPEED = 300.0/2
const JUMP_VELOCITY = -400.0
var speed : float
var djump : bool 
var can_move : bool 
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var anim : AnimationPlayer
@export var sprite : Sprite2D

@export var jumpsnd : AudioStreamPlayer2D
@export var deathsnd : AudioStreamPlayer2D
@export var hitsnd : AudioStreamPlayer2D
var heal : int 

enum {
	HIT,
	LIFE
}
var shild : bool = false
var state_anim := LIFE
func _ready() -> void:
	Root.mode = Root.GAME_MODE
	sprite.texture = load("res://scens/Player/skins/"+ Root.PlayerSkin + ".png")
	heal = Root.MAX_HEAL
	can_move = true
	djump = true
	speed = SPEED
	anim.play("spawn")
	set_physics_process(false)
	can_move = false
	state_anim = HIT
	
func _process(delta: float) -> void:

	_anim()
	
func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity.y += gravity * delta
	elif djump == false:
		djump = true
	move()
	move_and_slide()
func move() ->void:
	if !can_move: return
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
		scale.x = scale.y * direction

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() :
			jump()
		elif !is_on_floor() and djump:
			jump()
			djump = false


func jump(jump_force : int = 1, hit_jump : bool = false) -> void:
	if !hit_jump:
		jumpsnd.play()
	velocity.y = JUMP_VELOCITY * jump_force

func damage() ->void:
	if shild: return
	hitsnd.play()
	shild = true
	state_anim = HIT
	anim.play("hit")
	Root.emit_signal("hitPlayer")
	heal -=1
	if heal <=0:
		death()

func death()->void:
	set_physics_process(false)
	deathsnd.play()
	state_anim = HIT
	anim.play("die")
	await anim.animation_finished
	Root.emit_signal("PlayerDie")


func _anim()->void:
	if state_anim == HIT : return
	if is_on_floor():
		if velocity.x !=0:
			anim.play("run")
		else :
			anim.play("idle")
	else:
		if velocity.y > 0 :
			anim.play("fall")
			
		elif velocity.y < 0:
			if djump:
				anim.play("jump")
			else:
				anim.play("djump")




func _disable_hit()->void:
	set_physics_process(true)
	state_anim = LIFE
	can_move = true


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	death()
func _turn_shild()->void:
	shild = false
	
