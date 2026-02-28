extends Sprite2D
@export var alpha = 0.8
@export var speed = 15.0
@export var playerspeed = 20.0
@export var xdir = 0.0
@export var ydir = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate.a = alpha


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var playrvel = get_owner().velocity.normalized()
	position.x = fmod(position.x + delta*(xdir*speed-(playrvel.x*playerspeed)), 32.0)
	position.y = fmod(position.y + delta*(ydir*speed-(playrvel.y*playerspeed)), 32.0)
