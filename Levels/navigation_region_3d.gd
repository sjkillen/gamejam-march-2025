extends NavigationRegion3D



@export var number_of_rats = 1000

func _ready() -> void:
	for i in range(number_of_rats):
		await get_tree().create_timer(0.01).timeout
		spawn_rat()

func wait_until_region_added():
	while true:
		await NavigationServer3D.map_changed
		print(get_rid())

func spawn_rat():
	var where := NavigationServer3D.region_get_random_point(get_rid(), 1, false)
	var rat := preload("res://npc/npc.tscn").instantiate()
	rat.position = where
	add_child(rat)
	rat.global_position = where
