extends StaticBody2D

onready var player = get_parent().get_node("Player")

func _ready():
	pass

func _on_EnterArea_body_entered(body):
	if body == player:
		print("Entering Da Shop")
