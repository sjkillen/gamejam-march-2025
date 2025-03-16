extends AnimationPlayer

var rewardInt = 0

func _on_button_button_down() -> void:
	randNum()
	play("Slots")
	
func _on_animation_finished(anim_name: StringName) -> void:
		getReward()


#generate random numbers for the array array
func randNum():
	rewardInt = randi_range(1,4)

#will play reward animation + give you buff/debuff
func getReward():
	if rewardInt == 1:
#		Turn On visibilty
		$"../Orange".visible = true
		play("Reward 1")
		Globals.player_get_coin.emit()
		print("Orange")
		
	elif rewardInt == 2:
		$"../Apple".visible = true
		play("Reward 1")
		Globals.player_get_coin.emit()
		
	elif rewardInt == 3:
		$"../Bomb".visible = true
		play("Reward 1")
		Globals.player_get_coin.emit()
		
	elif rewardInt == 4:
		$"../Banana".visible = true
		play("Reward 1")
		Globals.player_get_coin.emit()
