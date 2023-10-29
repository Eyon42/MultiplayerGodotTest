extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	print("Hello")
	move_and_collide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

