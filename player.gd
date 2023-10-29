extends CharacterBody2D


const SPEED = 400.0

@export var side = "p1"
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction
	if side == "p1":
		direction = Input.get_axis("p1_up", "p1_down")
	else:
		direction = Input.get_axis("p2_up", "p2_down")
		
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_control_resized():
	if side == "p1":
		position.x = get_viewport_rect().size.x -50
		return
	position.x = get_viewport_rect().size.x -50
