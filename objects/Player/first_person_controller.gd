extends CharacterBody3D
class_name PlayerCollision


const SPEED = 5.0
const JUMP_POWER_BASE = 1.0 
const MOUSE_SENSITIVITY = 0.1
const CONTROLLER_SENSITITY = 3.0

var camera_move_event: Vector2 = Vector2.ZERO

var max_jump_charge = 10.0
@export var jump_charge_crouch_anim_curve: Curve
var jump_charge = 0.0
var jump_charge_time = .05


var prev_velocity := Vector3.ZERO

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	if is_on_floor() and prev_velocity.y < 0.0:
		%AnimationPlayer.play("Landing")
		
	if not is_on_floor():
		velocity += get_gravity() * delta


	camera_move(delta)
	
	if Input.is_action_just_released("ui_accept") and is_on_floor():
		velocity.y = JUMP_POWER_BASE + jump_charge
		
	if Input.is_action_pressed("ui_accept"):
		charge_jump(delta)
	else:
		jump_charge = 0.0


	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction: Vector3 = (%CameraRotation.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	prev_velocity = velocity
	move_and_slide()



func _process(_delta: float) -> void:
	# Crouching while charging jump
	%Camera3D.position.y = jump_charge_crouch_anim_curve.sample(jump_charge / max_jump_charge)	

func charge_jump(delta: float):
	var amount = delta * (1.0 / jump_charge_time)
	jump_charge += amount
	jump_charge = min(jump_charge, max_jump_charge)
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera_move_event = event.relative * MOUSE_SENSITIVITY
	if event.is_action("toggle_mouse_capture"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		

func camera_move(delta: float):
	var move := Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down") * CONTROLLER_SENSITITY
	if move == Vector2.ZERO:
		move = camera_move_event
	camera_move_event = Vector2.ZERO
	%Camera3D.global_rotation.x -= move.y*delta
	%Camera3D.global_rotation.x = clampf(%Camera3D.global_rotation.x, -1.0, 1.0)
	%CameraRotation.global_rotation.y -= move.x*delta
