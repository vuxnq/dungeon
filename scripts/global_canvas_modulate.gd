extends CanvasModulate

func _ready():
	$AnimationPlayer.play("cycle", -1, 1, false)
	$AnimationPlayer.advance(12)

func sleep():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("cycle")
	$AnimationPlayer.advance(8)

func _process(delta):
	if get_tree().current_scene.name == "World":
		self.visible = true
	elif get_tree().current_scene.name == "Dungeon":
		self.set_color("#000000")
	else:
		self.visible = false
