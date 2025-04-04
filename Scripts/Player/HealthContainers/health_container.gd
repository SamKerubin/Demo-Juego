extends CanvasLayer
class_name HealthContainer

const HEALTH: PackedScene = preload("res://Scenes/Player/HealthContainers/Health.tscn")
const HALF_HEALTH: PackedScene = preload("res://Scenes/Player/HealthContainers/HalfHealth.tscn")
const EMPTY_HEALTH: PackedScene = preload("res://Scenes/Player/HealthContainers/EmptyHealth.tscn")

@onready var health_container: GridContainer = $GridContainer

func _ready() -> void:
	_update_health()
	PlayerStats.re_asign_stats.connect(_update_health)

func _update_health() -> void:
	var temp_health: float = PlayerStats.health
	
	var containers: int = 1
	
	while temp_health >= 0 and containers <= PlayerStats.health_container: 
		var health: Variant
		if temp_health == 0:
			health = EMPTY_HEALTH.instantiate()
		if temp_health < 0:
			health = HALF_HEALTH.instantiate()
		else:
			health = HEALTH.instantiate()

		containers += 1
		temp_health -= 1
