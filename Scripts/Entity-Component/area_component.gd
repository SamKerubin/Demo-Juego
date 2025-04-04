extends Node2D
class_name AreaComponent

enum CollisionType {
	Capsule, Rectangle, Circle
}

@export_category("Collision Stats")
@export var type: CollisionType = CollisionType.Capsule
@export var size: float = 22

@export_category("Area Stats")
@export var layer_collision: int = 1
@export var mask_coliision: int = 2
