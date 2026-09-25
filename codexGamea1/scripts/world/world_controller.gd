extends Node3D

@onready var camera: Camera3D = $RTSCamera/Camera3D
var selected_survivor: Survivor

func _ready() -> void:
	DebugLog.info("World prototype loaded")

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton or not event.pressed:
		return
	var hit := _raycast_from_mouse(event.position)
	if event.button_index == MOUSE_BUTTON_LEFT:
		_select(hit.get("collider") as Node)
	elif event.button_index == MOUSE_BUTTON_RIGHT and selected_survivor and hit:
		selected_survivor.move_to(hit.position)

func _raycast_from_mouse(mouse_position: Vector2) -> Dictionary:
	var origin := camera.project_ray_origin(mouse_position)
	var end := origin + camera.project_ray_normal(mouse_position) * 1000.0
	var query := PhysicsRayQueryParameters3D.create(origin, end)
	return get_world_3d().direct_space_state.intersect_ray(query)

func _select(candidate: Node) -> void:
	if selected_survivor:
		selected_survivor.set_selected(false)
	selected_survivor = candidate as Survivor
	if selected_survivor:
		selected_survivor.set_selected(true)
