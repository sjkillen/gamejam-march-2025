extends Node3D
class_name Player


func _ready() -> void:
	Globals.player_get_coin.connect(get_coin)
	
func get_coin(coin: Coin):
	coin.queue_free()
	%Countdown.add_time_to_counter(0.75)


func _on_countdown_out_of_time() -> void:
	get_tree().change_scene_to_file("res://ui/death_screen.tscn")
