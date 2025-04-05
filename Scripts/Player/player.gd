extends CharacterBody2D
class_name Player

@export var stats: PlayerStats = load("res://Resources/Player/player_stats.tres")

@export_category("Components")
@export var damage_component: DamageComponent
@export var health_component: HealthComponent

@export_category("Health Container")
@export var health_container: HealthContainer
@export var hitted: bool = false

func _ready() -> void:
	_re_asign_stats()

	stats.re_asign_stats.connect(_re_asign_stats)

func _physics_process(delta: float) -> void: pass

func _on_damage_recieved() -> void:
	pass
	# Play the damage animation

func _game_over() -> void: 
	await get_tree().create_timer(2).timeout
	# Change scene or maybe instance a game over menu

func _re_asign_stats() -> void:
	damage_component.damage = stats.damage
	health_component.health = stats.health
	
	if stats.health_container <= 0:
		_game_over()
