extends Control


func _on_timer_timeout() -> void:
	jumpscare()

func jumpscare():
	var chance = randi_range(1, 3)
	
	if chance == 3:
		$RatScary.visible = true
		$AudioStreamPlayer2D.play()
		


func _on_audio_stream_player_2d_finished() -> void:
	$RatScary.visible = false
