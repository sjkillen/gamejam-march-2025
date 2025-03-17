extends Node

signal add_time_to_counter(secs: float)
signal player_get_coin(coin: Coin)
signal unpick_machine
signal pick_new_machine

signal new_slots(lucky: bool)
signal close_slots

signal query_shop_open(fn)

signal chase_player(v: bool)

var player_position: Vector3

func _use_signals():
	add_time_to_counter.emit(0.0)
	player_get_coin.emit(null)
	unpick_machine.emit()
	pick_new_machine.emit()
	chase_player.emit()
	new_slots.emit()
	close_slots.emit()
	
var randos = [3]
func random() -> int:
	if randos.size() == 0:
		var a = [1, 2, 4].pick_random()
		randos = [a, 3]
		randos.shuffle()
	return randos.pop_at(0)
	
