extends KinematicBody2D

var acceleration := 4000
var friction := 4000

var velocity := Vector2.ZERO
var speed = 500
var input_vector

onready var animation_tree := $AnimationTree

func _ready():
	animation_tree.active = true
	global_position = Global.player_position

func movement(delta):
	input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * speed, acceleration * delta)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	if input_vector != Vector2.ZERO:
		animation_tree.get("parameters/playback").travel("walk")
		animation_tree.set("parameters/walk/blend_position", input_vector)
	else:
		animation_tree.get("parameters/playback").travel("idle")
	
	velocity = move_and_slide(velocity)

func _physics_process(delta):
	movement(delta)
