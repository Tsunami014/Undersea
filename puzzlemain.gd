extends Control

var tileidx = 0
var tileamnt = 0

func _ready() -> void:
	visible = false
	tileamnt = len($Panel/Container.get_children())

func _setTile(newidx: int):
	if newidx < 0:
		newidx = tileamnt + newidx
	newidx = newidx % tileamnt
	tileidx = newidx

func increase():
	_setTile(tileidx + 1)
func decrease():
	_setTile(tileidx - 1)

func initPuz():
	_setTile(0)
	visible = true

func closePuz():
	visible = false
