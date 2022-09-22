extends KinematicBody2D

var acceleration := 4000
var friction := 4000

var velocity := Vector2.ZERO
var speed = 500
var input_vector

var inventory_opened = false

onready var inventory_path = preload("res://scenes/gui/inventory/inventory.tscn")
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
	if Input.is_action_just_pressed("inventory"):
		inventory()
	zoom()

func inventory():
	if inventory_opened:
		remove_child(get_node("Inventory"))
		inventory_opened = false
	else:
		add_child(inventory_path.instance())
		inventory_opened = true

func zoom():
	if Input.is_action_just_released("ui_mouse_wheel_down") and $Camera2D.zoom < Vector2(5, 5):
		$Camera2D.zoom += Vector2(0.1, 0.1)
	elif Input.is_action_just_released("ui_mouse_wheel_up") and $Camera2D.zoom > Vector2(0.1, 0.1):
		$Camera2D.zoom -= Vector2(0.1, 0.1)
