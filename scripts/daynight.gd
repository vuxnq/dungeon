extends CanvasModulate

func _ready():
	$AnimationPlayer.play("Day&Night")
	$AnimationPlayer.playback_speed = 0.5
