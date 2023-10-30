extends CharacterBody2D


const SPEED = 400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if GameManager.online:
		$MultiplayerSynchronizer.set_multiplayer_authority(str(name).to_int())

func isActivePlayer():
	return $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id()

func move(direction):
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction
	if GameManager.online:
		if isActivePlayer():
			direction = Input.get_axis("p1_up", "p1_down")
			move(direction)
	else:
		if name == "1":
			direction = Input.get_axis("p1_up", "p1_down")
		else:
			direction = Input.get_axis("p2_up", "p2_down")
		move(direction)

	move_and_slide()


func _on_control_resized():
	if name == "1":
		position.x = get_viewport_rect().size.x -50
		return
	position.x = get_viewport_rect().size.x -50
