extends Area2D
class_name HealthComponent

signal on_death

@onready var area_component: Node2D = $AreaComponent

@export_category("Entity")
@export var entity: CharacterBody2D

@export_category("Entity Health")
@export var health: int = 6

var is_alive: bool = true

func _on_damage_recieved(damage: float) -> void: 
	if is_alive:
		health -= damage

		if health <= 0:
			is_alive = false
			on_death.emit()
