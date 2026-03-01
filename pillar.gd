extends Sprite2D
var inside = false

@export var door: Door
@export var loseAmnt = 30
@export_enum("blue", "green", "orange", "pink") var ans_1: String = "blue"
@export_enum("blue", "green", "orange", "pink") var ans_2: String = "blue"

const order = [
	"blue", "green", "orange", "pink"
]

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
	if inside:
		if Input.is_action_just_pressed("open_puzzle") and not %Player.justclosed:
			%Player.puzzle()
	if %Player.puzzling and Input.is_action_just_pressed("action"):
		var out: Array[int] = []
		for i in [ans_1, ans_2]:
			out.append(order.find(i))
		if %Player.puzzleobj.trycode(out):
			door.openDoor()
			queue_free()
		else:
			%Player.air -= loseAmnt
		%Player.closePuz()
