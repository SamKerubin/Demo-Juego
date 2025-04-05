extends Node
class_name MovementComponent

@export_category("Entity")
@export var entity: CharacterBody2D
@export var speed: float = 1
@export var can_move: bool = true

func _move_entity() -> void:
	var direction: Vector2 = Input.get_vector("D", "A", "W", "S")

	if can_move:
		entity.velocity = direction.normalized() * (speed * 300)
		entity.move_and_slide()
