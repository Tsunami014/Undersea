extends Sprite2D
@export var alpha = 0.7
@export var speed = 32.0
@export var xdir = 0.0
@export var ydir = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate.a = alpha


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = fmod(position.x + delta*xdir*speed, 32.0)
	position.y = fmod(position.y + delta*ydir*speed, 32.0)
