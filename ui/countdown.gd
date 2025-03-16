extends Control

signal out_of_time

const REGULAR_COUNTDOWN = 1.0
const LOSE_SPEED = 10.0
const REVERSE_SPEED = -10.0
var speed = -1.0

var losing_money: int = 0

func _ready() -> void:
	Globals.add_time_to_counter.connect(add_time_to_counter)
	%"100s".play("default")
	%"10s".play("default")
	%"1s".play("default")

func _process(_delta: float) -> void:
	if %Timer.is_stopped():
		if losing_money > 0:
			speed = LOSE_SPEED * losing_money
			%LosingAnimation.play("new_animation")
			%LosingMoneyIcon.visible = true
		else:
			speed = REGULAR_COUNTDOWN
			%LosingAnimation.stop()
			%LosingMoneyIcon.visible = false
		%Winning.visible = false
		%Winning/WinningANim.stop()
	else:
		%Winning.visible = true
		%Winning/WinningANim.play("new_animation")
		speed = REVERSE_SPEED
	
	
	%"100s".speed_scale = 0.1 * speed
	%"10s".speed_scale = 1.0 * speed
	%"1s".speed_scale = 10.0 * speed


func add_time_to_counter(amount: float):
	if %Timer.is_stopped():
		%Timer.start(amount)
		return
	var left: float = %Timer.time_left
	%Timer.stop()
	%Timer.start(left + amount)


func _on_100s_animation_loop() -> void:
	if speed < 0.0:
		%"100s".frame = 0
	else:
		out_of_time.emit()


func _on_10s_animation_loop() -> void:
	if %"100s".frame == 0:
		%"10s".frame = 0


func _on_1s_animation_loop() -> void:
	if %"100s".frame == 0:
		%"1s".frame = 0
