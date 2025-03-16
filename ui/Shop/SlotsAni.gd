extends AnimationPlayer

var rewardInt = 0

func _on_button_button_down() -> void:
	randNum()
	play("Slots")

#generate random numbers for the array array
func randNum():
	rewardInt = randi_range(1,6)

#will play reward animation + give you buff/debuff
func getReward():
	if rewardInt == 1:
		print(1)
	elif rewardInt == 2:
		print(2)
	elif rewardInt == 3:
		print(3)
	elif rewardInt == 4:
		print(4)
	elif rewardInt == 5:
		print(5)
	elif rewardInt == 6:
		print(6)
