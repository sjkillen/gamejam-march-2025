extends Node

signal add_time_to_counter(secs: float)
signal player_get_coin(coin: Coin)
signal unpick_machine
signal pick_new_machine

func _use_signals():
	add_time_to_counter.emit(0.0)
	player_get_coin.emit(null)
	unpick_machine.emit()
	pick_new_machine.emit()
