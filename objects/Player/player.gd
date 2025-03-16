extends Node3D
class_name Player


func _ready() -> void:
	Globals.player_get_coin.connect(get_coin)
	
func get_coin(coin: Coin):
	$Collect.play()
	coin.queue_free()
	%Countdown.add_time_to_counter(0.75)


func _on_countdown_out_of_time() -> void:
	get_tree().change_scene_to_file("res://ui/death_screen.tscn")

var touching_npcs := 0

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is NPC:
		$NpcBump.play()
		touching_npcs += 1
		%Countdown.losing_money = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is NPC:
		touching_npcs = max(touching_npcs - 1, 0)
		if touching_npcs == 0: 
			%Countdown.losing_money = false
