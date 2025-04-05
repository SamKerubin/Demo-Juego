extends Area2D
class_name HealthComponent

signal on_death
signal on_damage

@export var area: AreaComponent = load("res://Resources/Entity-Components/area_component.tres")

@export_category("Entity")
@export var entity: CharacterBody2D

@export_category("Entity Health")
@export var health: float = 6

@onready var collision: CollisionShape2D = $CollisionShape2D

var is_alive: bool = true
func _ready() -> void:
	collision.shape = area.get_shape()

	area.set_size(collision.shape)

func _on_damage_recieved(damage: float) -> void: 
	if is_alive:
		health -= damage

		on_damage.emit()

		if health <= 0:
			is_alive = false

			on_death.emit()
