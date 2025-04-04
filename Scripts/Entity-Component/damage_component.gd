extends Area2D
class_name DamageComponent

signal do_damage(damage: float)

@onready var area_component: Node2D = $AreaComponent

@export_category("Entity")
@export var entity: CharacterBody2D

@export_category("Entity Damage")
@export var damage: float = 3.4

func _on_entity_entered(body: Node2D) -> void:
	if body is HealthComponent:
		body.connect("do_damage", Callable(body, "_on_damage_recieved").bind(damage))
