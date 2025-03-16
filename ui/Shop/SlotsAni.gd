extends AnimationPlayer

var rewardInt = 0

var spun = false

func _on_button_button_down() -> void:
	if spun:
		return
	spun = true
	$"../SlotSound".play()
	randNum()
	play("Slots")
	
func _on_animation_finished(anim_name: StringName) -> void:
		await getReward()
		Globals.pick_new_machine.emit()
		Globals.close_slots.emit()


#generate random numbers for the array array
func randNum():
	rewardInt = randi_range(1,4)

#will play reward animation + give you buff/debuff
func getReward():
	if rewardInt == 1:
#		Turn On visibilty
		$"../Orange".visible = true
		play("Reward 1")
		Globals.add_time_to_counter.emit(5.0)
		
	elif rewardInt == 2:
		$"../Apple".visible = true
		play("Reward 1")
		Globals.add_time_to_counter.emit(5.0)
		
	elif rewardInt == 3:
		$"../Bomb".visible = true
		Globals.chase_player.emit(true)
		play("Reward 1")
		
	elif rewardInt == 4:
		$"../Banana".visible = true
		play("Reward 1")
		Globals.add_time_to_counter.emit(5.0)
	else:
		return
	await animation_finished
	$"../Collect".play()

func _input(event: InputEvent) -> void:
	if not event.is_action("ui_accept"):
		return
	get_viewport().set_input_as_handled()
	_on_button_button_down()
