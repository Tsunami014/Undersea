extends Sprite2D

var inside = false
@export var airIncrease = 30.0

func _on_body_entered(body):
	if body is Player:
		inside = true
func _on_body_exited(body):
	if body is Player:
		inside = false

func _process(delta: float) -> void:
	if inside:
		%Player.air += delta * (airIncrease + %Player.airSpeed)
		%Player.lastSafePos = %Player.global_position
