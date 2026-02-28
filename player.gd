extends CharacterBody2D
@export var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var vel = Input.get_vector("left", "right", "up", "down")
	velocity = vel * speed
	move_and_slide()
	if vel.x != 0:
		$Sprite.flip_h = vel.x < 0
	if velocity.is_zero_approx():
		$Sprite.stop()
	else:
		if not $Sprite.is_playing():
			$Sprite.play("default")
			$Sprite.frame += 1
		else:
			$Sprite.play("default")
