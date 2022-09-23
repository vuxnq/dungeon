extends StaticBody2D

func _on_InteractArea_body_entered(body):
	if body.name == "Player":
		print("sleeping (house_bed.gd)")
		GlobalCanvasModulate.sleep()
		Global.player_energy = 100
