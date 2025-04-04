extends CharacterBody2D
class_name Player

@export_category("Stats")
@export var damage_component: DamageComponent
@export var health_component: HealthComponent
@export var speed: int = 1
@export var luck: int = 0

@export_category("Health Container")
@export var health_container: HealthContainer

func _ready() -> void:
	PlayerStats.re_asign_stats.connect(_re_asign_stats)

func _physics_process(delta: float) -> void: pass

func _game_over() -> void:
	pass

func _re_asign_stats() -> void:
	damage_component.damage = PlayerStats.damage
	health_component.health = PlayerStats.health
	speed = PlayerStats.speed
	luck = PlayerStats.luck
