@tool
extends Sprite2D
class_name PuzzleTile

@export var idx: int
@export_enum("blue", "green", "orange", "pink") var tile: String

const order = [
	"blue", "green", "orange", "pink"
]

const ATLAS = preload("res://assets/puzzletiles.png")

func _ready() -> void:
	var tex = AtlasTexture.new()
	tex.atlas = ATLAS
	tex.region = Rect2(
		idx*16, getTile()*16, 16, 16
	)
	texture = tex

func getTile() -> int:
	return order.find(tile)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
