class_name RTSCamera
extends Node3D

@export var pan_speed := 14.0
@export var rotation_speed := 0.008
@export var zoom_step := 2.0
@export var min_zoom := 8.0
@export var max_zoom := 28.0

@onready var camera: Camera3D = $Camera3D
var _rotating := false

func _process(delta: float) -> void:
	var input_vector := Input.get_vector("camera_left", "camera_right", "camera_forward", "camera_back")
	var forward := -global_transform.basis.z
	forward.y = 0.0
	forward = forward.normalized()
	var right := global_transform.basis.x
	right.y = 0.0
	right = right.normalized()
	global_position += (right * input_vector.x + forward * -input_vector.y) * pan_speed * delta

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			_rotating = event.pressed
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_set_zoom(camera.position.z - zoom_step)
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_set_zoom(camera.position.z + zoom_step)
	elif event is InputEventMouseMotion and _rotating:
		rotate_y(-event.relative.x * rotation_speed)

func _set_zoom(value: float) -> void:
	camera.position.z = clampf(value, min_zoom, max_zoom)
