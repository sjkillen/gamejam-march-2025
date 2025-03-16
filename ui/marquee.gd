extends Control

const scroll_speed = 1.0

var messages = [
	"ALL MACHINES ARE NOW HOT FOR THE NEXT 30 SECONDS GAMBLE GAMBLE GAMBLE!",
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	await play_message("WELCOME TO CASINO PLEASE ENJOY COMPLIMENTARY BEVERAGES FROM THE BAR")
	await get_tree().create_timer(10.0).timeout
	await play_message("TIME = MONEY, IF YOU RUN OUT, PLEASE DIE SOMEWHERE RESPONSIBLE - THANKS, MGMT.")
	await get_tree().create_timer(5.0).timeout
	await play_message("SOME PATRONS HAVE BEEN DROPPING THEIR MONEY, FINDERS KEEPERS")
	while true:
		messages.shuffle()
		for message in messages:
			await get_tree().create_timer(randf_range(30.0, 200.0)).timeout
			await play_message(message)
		
	


func play_message(msg: String):
	$Marquee.play()
	%Label.text = msg
	visible = true
	var w: float = %Label.size.x
	%Label.position.x = get_viewport().size.x
	var tween := create_tween()
	tween.tween_property(%Label, "position:x", -w, (0.01 / scroll_speed) * w)
	await tween.finished
	visible = false
