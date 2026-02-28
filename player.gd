extends CharacterBody2D
class_name Player
@export var speed = 200 # Max speed
@export var accel = 500
@export var friction = 400

@export var air = 100.0
@export var airSpeed = 2.0


func _process(delta: float) -> void:
	air -= delta * airSpeed
	var vel = Input.get_vector("left", "right", "up", "down") * speed

	if velocity.is_zero_approx():
		velocity = velocity.move_toward(vel, friction * delta)
		$Sprite.stop()
	else:
		velocity = velocity.move_toward(vel, accel * delta)
		if not $Sprite.is_playing():
			$Sprite.play("default")
			$Sprite.frame += 1
		else:
			$Sprite.play("default")
	move_and_slide()
	if vel.x != 0:
		$Sprite.flip_h = vel.x < 0
