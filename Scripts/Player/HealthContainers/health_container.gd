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
	_clear_children()
	
	var health: float = player.stats.health
	var max_health: int = player.stats.health_container
	
	for c: int in range(max_health): 
		var heart: Variant
		
		if health >= 1:
			heart = HEALTH.instantiate()
		elif health > 0:
			heart = HALF_HEALTH.instantiate()
		else:
			heart = EMPTY_HEALTH.instantiate()
			
		health_container.add_child(heart)
		
		health -= 1

func _clear_children() -> void:
	for child: Control in health_container.get_children():
		child.queue_free()
