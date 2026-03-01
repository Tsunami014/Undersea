extends CharacterBody2D
class_name Player
@export var speed = 200 # Max speed
@export var accel = 500
@export var friction = 400

@export var air = 100.0
@export var airSpeed = 6.0

@onready var puzzleobj = %Puzzle

var puzzling = false
var justclosed = false

func _ready():
	%Puzzle.visible = false

func die():
	pass

func _process(delta: float) -> void:
	justclosed = false
	if puzzling:
		if Input.is_action_just_pressed("left"):
			%Puzzle.decrease()
		if Input.is_action_just_pressed("right"):
			%Puzzle.increase()

		if Input.is_action_just_pressed("open_puzzle"):
			closePuz()
	else:
		air -= delta * airSpeed
		if air < 0:
			die()
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

func puzzle():
	if puzzling:
		return
	$Sprite.stop()
	puzzling = true
	%Puzzle.visible = true
	%Puzzle.initPuz()
func closePuz():
	puzzling = false
	%Puzzle.visible = false
	justclosed = true
	%Puzzle.closePuz()
