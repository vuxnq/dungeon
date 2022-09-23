extends StaticBody2D

export(PackedScene) var interior

func _ready():
	pass

func _on_EnterArea_body_entered(body):
	if body.name == "Player":
		Global.player_position = body.global_position
		Global.player_position.y += 50
# warning-ignore:return_value_discarded
		get_tree().change_scene_to(interior)
