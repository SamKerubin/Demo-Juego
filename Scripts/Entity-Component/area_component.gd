extends Resource
class_name AreaComponent

@export_category("Collision Stats")
@export_enum("Capsule", "Rectangle", "Circle") var type: String = "Capsule"
@export var size: Vector2 = Vector2(22, 22)

func get_shape() -> Shape2D:
	match type:
		"Capsule": return CapsuleShape2D.new()
		"Rectangle": return RectangleShape2D.new()
		"Circle": return CircleShape2D.new()
		_: return null

func set_size(shape: Shape2D) -> void:
	if shape == CapsuleShape2D:
		shape.radius = size.x
		shape.height = size.y
		return
	if shape == RectangleShape2D:
		shape.size = size
		return
	shape.radius = size.x
