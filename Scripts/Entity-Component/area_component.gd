extends Resource
class_name AreaComponent

enum CollisionType {
	Capsule, Rectangle, Circle
}

@export_category("Collision Stats")
@export var type: CollisionType = CollisionType.Capsule
@export var size: Vector2 = Vector2(22, 22)

func get_shape() -> Shape2D:
	match type:
		CollisionType.Capsule:
			return CapsuleShape2D.new()
		CollisionType.Rectangle:
			return RectangleShape2D.new()
		CollisionType.Circle:
			return CircleShape2D.new()
		_:
			return null
func is_capsule_or_circle() -> bool:
	return type == CollisionType.Capsule or type == CollisionType.Circle
