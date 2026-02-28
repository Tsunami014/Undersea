extends ColorRect

@onready var player: Player = get_owner()
@onready var maxHei = get_size().y

func _ready() -> void:
	_update()
func _process(delta: float) -> void:
	_update()

func _update():
	size.y = (maxHei / 100) * player.air
