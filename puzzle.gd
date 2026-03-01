@tool
extends Control
class_name PuzzleElm

const ATLAS = preload("res://assets/puzzletiles.png")

@export var selecting = false
@export var choice = 0
@export var idx = 0

@onready var maxidx: int = ATLAS.get_height()/16

func _ready() -> void:
	custom_minimum_size = Vector2(18, 32)
	size = Vector2(18, 32)
	var highlight = ColorRect.new()
	highlight.name = "Highlight"
	highlight.color = Color("ffff7d")
	highlight.size = Vector2(18, 18)
	highlight.position = Vector2(0, 7)
	add_child(highlight)
	var tex = TextureRect.new()
	tex.texture = AtlasTexture.new()
	tex.texture.atlas = ATLAS
	tex.texture.region = Rect2(0, 0, 16, 16)
	tex.size = Vector2(16, 16)
	tex.position = Vector2(1, 8)
	tex.name = "Texture"
	add_child(tex)
	
	_process(0)

func _process(_delta: float) -> void:
	$Highlight.visible = selecting
	if selecting:
		if Input.is_action_just_pressed("up"):
			choice -= 1
		if Input.is_action_just_pressed("down"):
			choice += 1
		if choice < 0:
			choice = maxidx + choice
		choice = (choice % maxidx)
	$Texture.texture.region = Rect2(
		idx*16, choice*16, 16, 16
	)
