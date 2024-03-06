extends RigidBody2D

export var sceneName: String = "LoseScreen"

const UP = Vector2(0, -1)

export var initialspeed: int = 0
export var GRAVITY: int = 0

var velocity: Vector2 = Vector2()

func _ready():
	contact_monitor = true
	contacts_reported = 1

func _on_Node2D_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
	else:
		queue_free()

func _physics_process(_delta):
	print_debug(linear_velocity)


func _process(_delta):
	self.rotation_degrees = -linear_velocity.y/3
	
	if self.rotation_degrees > 90:
		self.rotation_degrees = 90
	if self.rotation_degrees < -90:
		self.rotation_degrees = -90
