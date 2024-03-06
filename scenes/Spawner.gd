extends Node2D

export (PackedScene) var obstacle
export var timer: float = 1
export var firstdelay: float = 1
export var therange: int = 0

func _ready():
	spawn()
	yield(get_tree().create_timer(firstdelay), "timeout")
	repeat()

func spawn():
	var spawned = obstacle.instance()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + rand_range(-therange, therange)

	spawned.global_position = spawn_pos

func repeat():
	spawn()
	yield(get_tree().create_timer(timer), "timeout")
	repeat()
