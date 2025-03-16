extends RigidBody3D

var starting_region = null
const SPEED = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await save_current_region(get_world_3d().get_navigation_map())
	path_to_random()
	_on_drop_coin_timeout()
	$DropCoin.start(100.0 * randf_range(0.5, 2.0))

func save_current_region(map: RID):
	while true:
		for region in NavigationServer3D.map_get_regions(map):
			if NavigationServer3D.region_owns_point(region, global_position):
				starting_region = region
				return
		map = await NavigationServer3D.map_changed
	

	

func path_to_random():
	if starting_region == null:
		return
	%NavigationAgent3D.target_position = NavigationServer3D.region_get_random_point(starting_region, 1, false)

func _physics_process(delta: float) -> void:
	if (%NavigationAgent3D.target_position - global_position).length() <= 1.0:
		path_to_random()
	var local_target: Vector3 = %NavigationAgent3D.get_next_path_position()
	var dist = (local_target - global_position).length()
	if dist == 0.0:
		return
	global_position = lerp(global_position, local_target, (delta * SPEED) / dist)
	
	


func _on_drop_coin_timeout() -> void:
	var coin := preload("res://objects/coin/coin.tscn").instantiate()
	coin.position = position
	get_parent().add_child(coin)
