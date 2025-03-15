extends RayCast3D

@onready var prompt = $Label

func _physics_process(delta: float) -> void:
	
#	set text to nothing
	prompt.text = ""
	
	if is_colliding():
		var collider = get_collider()
		
		prompt.text = collider.name
