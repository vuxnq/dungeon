extends StaticBody2D

export(PackedScene) var interior

onready var player = get_parent().get_node("Player")

func _ready():
	pass

func _on_EnterArea_body_entered(body):
	if body == player:
		Global.player_position = body.global_position
		Global.player_position.y += 50
# warning-ignore:return_value_discarded
		get_tree().change_scene_to(interior)
