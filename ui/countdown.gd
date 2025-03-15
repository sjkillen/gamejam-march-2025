@tool
extends Control

signal out_of_time

const REGULAR_COUNTDOWN = 1.0
const REVERSE_SPEED = -10.0
var speed = -1.0

func _ready() -> void:
	Globals.add_time_to_counter.connect(add_time_to_counter)
	%"100s".play("default")
	%"10s".play("default")
	%"1s".play("default")

func _process(delta: float) -> void:
	if %Timer.is_stopped():
		speed = REGULAR_COUNTDOWN
	else:
		speed = REVERSE_SPEED
	
	%"100s".speed_scale = 0.1 * speed
	%"10s".speed_scale = 1.0 * speed
	%"1s".speed_scale = 10.0 * speed
	
	if %"100s".frame == (%"100s".sprite_frames.get_frame_count("default") - 1):
		out_of_time.emit()

func add_time_to_counter(amount: float):
	if %Timer.is_stopped():
		%Timer.start(amount)
		return
	var left: float = %Timer.time_left
	%Timer.stop()
	%Timer.start(left + amount)
