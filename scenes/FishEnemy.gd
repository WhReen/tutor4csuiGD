extends RigidBody2D

export var sceneName: String = "LoseScreen"

const UP = Vector2(0, -1)

export var initialspeed: int = 400
export var GRAVITY: int = 1200

var velocity: Vector2 = Vector2()

func _ready():
	velocity.y = -initialspeed

func _on_Node2D_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
	else:
		body.queue_free()

func _physics_process(_delta):
	velocity.y += _delta * GRAVITY
	velocity = move_and_slide(velocity, UP)


func _process(_delta):
	self.rotation_degrees = velocity.y/initialspeed
	
	if self.rotation_degrees > 90:
		self.rotation_degrees = 90
	if self.rotation_degrees < -90:
		self.rotation_degrees = -90
