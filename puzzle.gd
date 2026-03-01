extends Control

@export var selecting = true
@export var choice = 0
@export var idx = 0

@onready var maxidx: int = $Texture.texture.atlas.get_height()/16

func _ready() -> void:
	_process(0)

func _process(_delta: float) -> void:
	$Highlight.visible = selecting
	if selecting:
		if Input.is_action_just_pressed("up"):
			choice -= 1
		if Input.is_action_just_pressed("down"):
			choice += 1
		choice = (abs(choice) % maxidx)
	$Texture.texture.region = Rect2(
		idx*16, choice*16, 16, 16
	)
