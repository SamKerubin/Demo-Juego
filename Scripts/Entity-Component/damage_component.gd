extends Area2D
class_name DamageComponent

signal do_damage(damage: float)

@export var area: AreaComponent = load("res://Resources/Entity-Components/area_component.tres")

@export_category("Entity")
@export var entity: CharacterBody2D

@export_category("Entity Damage")
@export var damage: float = 3.4
@export var dmg_span: float = 1

@onready var collision: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	collision.shape = area.get_shape()
	
	area.set_size(collision.shape)

func _on_entity_entered(body: Node2D) -> void:
	if body is HealthComponent:
		body.connect("do_damage", Callable(body, "_on_damage_recieved").bind(damage))
