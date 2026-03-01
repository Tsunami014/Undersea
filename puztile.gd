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
	texture = tex
	reload()
	%Player.connect("death", reload)

func reload():
	tile = order[randi_range(0, len(order)-1)]
	texture.region = Rect2(
		idx*16, getTile()*16, 16, 16
	)

func getTile() -> int:
	return order.find(tile)
