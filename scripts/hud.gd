extends CanvasLayer

onready var heart_full = preload("res://assets/gui/heart_full.png")
onready var heart_half = preload("res://assets/gui/heart_half.png")
onready var heart_empty = preload("res://assets/gui/heart_empty.png")

func _process(_delta):
	health()
	energy()
	money()

func health():
	if Global.player_health == 6:
		$Health/Heart1.texture = heart_full
		$Health/Heart2.texture = heart_full
		$Health/Heart3.texture = heart_full
	elif Global.player_health == 5:
		$Health/Heart1.texture = heart_full
		$Health/Heart2.texture = heart_full
		$Health/Heart3.texture = heart_half
	elif Global.player_health == 4:
		$Health/Heart1.texture = heart_full
		$Health/Heart2.texture = heart_full
		$Health/Heart3.texture = heart_empty
	elif Global.player_health == 3:
		$Health/Heart1.texture = heart_full
		$Health/Heart2.texture = heart_half
		$Health/Heart3.texture = heart_empty
	elif Global.player_health == 2:
		$Health/Heart1.texture = heart_full
		$Health/Heart2.texture = heart_empty
		$Health/Heart3.texture = heart_empty
	elif Global.player_health == 1:
		$Health/Heart1.texture = heart_half
		$Health/Heart2.texture = heart_empty
		$Health/Heart3.texture = heart_empty
	else:
		$Health/Heart1.texture = heart_empty
		$Health/Heart2.texture = heart_empty
		$Health/Heart3.texture = heart_empty

func energy():
	$Energy/TextureProgress.value = Global.player_energy

func money():
	$Money/Label.text = str(Global.player_money)
