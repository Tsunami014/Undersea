extends ColorRect

@onready var player: Player = get_owner()
@onready var maxHei = get_size().y

@export var startcol = Color(0.357, 0.55, 0.754, 1.0)
@export var endcol = Color(0.388, 0.327, 0.222, 1.0)
@export var warncol = Color(0.592, 0.224, 0.231, 1.0)
var warn_flash = 0
@export var warn_flash_speed = 0.1 # flashes/sec

func _ready() -> void:
	_update()
func _process(delta: float) -> void:
	if player.air < 10:
		warn_flash = fmod(warn_flash + delta * (1/warn_flash_speed), 2.0)
	_update()

func _update():
	if player.air < 10:
		size.y = maxHei
		if warn_flash > 1.0:
			color = Color(0, 0, 0, 0)
		else:
			color = warncol
	else:
		size.y = (maxHei / 100) * player.air
		color = startcol.lerp(endcol, 1 - (player.air-10)/90)
