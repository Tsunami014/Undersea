extends Sprite2D
var inside = false

@export var door: Door

func _on_body_entered(body):
	if body is Player:
		inside = true
		_setColour(Color(0.956, 0.945, 0.0, 1.0))
func _on_body_exited(body, force: bool = false):
	if force or body is Player:
		inside = false
		_setColour(Color(0.291, 0.418, 0.445, 1.0))

func _setColour(col: Color):
	set_instance_shader_parameter("outline_colour", col)

func _ready() -> void:
	_on_body_exited(null, true)

func _process(delta: float) -> void:
	if inside and Input.is_action_just_pressed("open_puzzle") and not %Player.justclosed:
		%Player.puzzle()
