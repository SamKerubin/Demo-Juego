extends CharacterBody2D
class_name Player

@export var stats: PlayerStats = load("res://Resources/Player/player_stats.tres")

@export_category("Components")
@export var damage_component: DamageComponent
@export var health_component: HealthComponent
@export var movement_component: MovementComponent

@export_category("Health Container")
@export var health_container: HealthContainer
@export var hitted: bool = false

@export_category("Player Attack")
@export var attacked: bool = false

@onready var player_animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	_re_asign_stats()

	stats.re_asign_stats.connect(_re_asign_stats)

func _physics_process(delta: float) -> void: 
	movement_component._move_entity()

func _on_damage_done() -> void:
	if !attacked:
		player_animation.play("Attack_Done")

func _on_damage_recieved(damage: float) -> void:
	if !hitted:
		player_animation.play("Up_Damage_Animation")
		health_component.health -= damage

func _game_over() -> void: 
	await get_tree().create_timer(2).timeout
	# Change scene or maybe instance a game over menu

func _re_asign_stats() -> void:
	damage_component.damage = stats.damage
	health_component.set("health", stats.health)
	movement_component.speed = stats.speed

	if stats.health_container <= 0:
		_game_over()
