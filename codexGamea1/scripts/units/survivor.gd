class_name Survivor
extends CharacterBody3D

@export var movement_speed := 5.0
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var selection_ring: MeshInstance3D = $SelectionRing

func _ready() -> void:
	selection_ring.visible = false
	DebugLog.info("Survivor ready")

func set_selected(selected: bool) -> void:
	selection_ring.visible = selected

func move_to(target: Vector3) -> void:
	navigation_agent.target_position = target

func _physics_process(_delta: float) -> void:
	if navigation_agent.is_navigation_finished():
		velocity = Vector3.ZERO
		return
	var next_position := navigation_agent.get_next_path_position()
	var direction := global_position.direction_to(next_position)
	direction.y = 0.0
	velocity = direction.normalized() * movement_speed
	move_and_slide()
