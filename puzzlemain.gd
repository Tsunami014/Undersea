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
	var elms = $Panel/Container.get_children()
	elms[tileidx].selecting = false
	elms[newidx].selecting = true
	tileidx = newidx

func increase():
	_setTile(tileidx + 1)
func decrease():
	_setTile(tileidx - 1)

func trycode(codes: Array[int]) -> bool:
	var elms = $Panel/Container.get_children()
	var i = 0
	for e in elms:
		if e.choice != codes[i]:
			return false
		i += 1
	return true

func initPuz():
	var elms = $Panel/Container.get_children()
	for e in elms:
		e.choice = 0
		e.selecting = false
	_setTile(0)
	visible = true

func closePuz():
	visible = false
