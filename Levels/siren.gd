extends AudioStreamPlayer

func _ready() -> void:
	Globals.chase_player.connect(chase_player)

func chase_player(v: bool):
	if v:
		play()
	else:
		stop()
