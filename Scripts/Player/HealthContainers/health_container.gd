extends CanvasLayer
class_name HealthContainer

const HEALTH: PackedScene = preload("res://Scenes/Player/HealthContainers/Health.tscn")
const HALF_HEALTH: PackedScene = preload("res://Scenes/Player/HealthContainers/HalfHealth.tscn")
const EMPTY_HEALTH: PackedScene = preload("res://Scenes/Player/HealthContainers/EmptyHealth.tscn")

@export var player: Player

@onready var health_container: GridContainer = $GridContainer

func _ready() -> void:
	_update_health()
	
	player.stats.re_asign_stats.connect(_update_health)
	player.health_component.on_damage.connect(_update_health)

func _update_health() -> void:
	var temp_health: float = player.stats.health

	var containers: int = 1

	while containers <= player.stats.health_container: 

		var health: Variant
		
		if temp_health == 0:
			health = EMPTY_HEALTH.instantiate()
		if temp_health == 0.5:
			health = HALF_HEALTH.instantiate()
		else:
			health = HEALTH.instantiate()

		health_container.add_child(health)

		containers += 1
		temp_health -= 1
