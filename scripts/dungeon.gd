extends Node2D

onready var player = $Player

func _ready():
	player.global_position = Vector2.ZERO

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		exit()

func exit():
	get_tree().change_scene("res://scenes/world.tscn")
