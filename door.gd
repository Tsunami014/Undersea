@tool
extends Sprite2D
class_name Door

@export var teleport: Door
@export var startUnlocked = false
var inside = false
var unlock = 0

const ATLAS = preload("res://assets/tileset.png")

func _ready() -> void:
	texture = AtlasTexture.new()
	texture.atlas = ATLAS
	_on_body_exited(null, true)
	if startUnlocked:
		unlock = 2
	setImg()

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

func setImg():
	var pos = [
		Rect2(192, 48, 32, 16),
		Rect2(192+32, 48, 32, 16),
		Rect2(192+64, 48, 32, 16)
	]
	texture.region = pos[unlock]

func openDoor():
	if unlock == 0:
		unlock = 1
		teleport.unlock = 1
		await get_tree().create_timer(0.05).timeout
		setImg()
		teleport.setImg()
		await get_tree().create_timer(0.35).timeout
		unlock = 2
		teleport.unlock = 2
		setImg()
		teleport.setImg()

func _process(_delta: float) -> void:
	if inside and unlock == 2 and Input.is_action_just_pressed("action"):
		%Player.global_position = teleport.get_node("Tele").global_position
		%Player.velocity = Vector2(0, 0)
