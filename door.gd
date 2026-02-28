extends Sprite2D

func _ready() -> void:
	_on_body_exited(null, true)

func _on_body_entered(body):
	if body is Player:
		_setColour(Color(0.956, 0.945, 0.0, 1.0))
func _on_body_exited(body, force: bool = false):
	if force or body is Player:
		_setColour(Color(0.291, 0.418, 0.445, 1.0))

func _setColour(col: Color):
	set_instance_shader_parameter("outline_colour", col)
