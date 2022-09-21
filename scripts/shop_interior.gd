extends Node2D

onready var player = $Player

func _ready():
	player.global_position = Vector2.ZERO

func _on_ExitArea_body_entered(body):
	if body == player:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/world.tscn")
