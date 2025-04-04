extends Area2D
class_name DamageComponent

signal do_damage(damage: float)

@export var area_component: AreaComponent = load("res://Resources/Entity-Components/area_component.tres")

@export_category("Entity")
@export var entity: CharacterBody2D

@export_category("Entity Damage")
@export var damage: float = 3.4

@onready var collision: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	collision.shape = area_component.get_shape()
	
	if area_component.is_capsule_or_circle():
		collision.shape.radius = area_component.size.x
	else:
		collision.shape.size = area_component.size

func _on_entity_entered(body: Node2D) -> void:
	if body is HealthComponent:
		body.connect("do_damage", Callable(body, "_on_damage_recieved").bind(damage))
