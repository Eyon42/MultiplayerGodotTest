extends Area2D
class_name Ball

var isBall = true

var direction = Vector2.ZERO
const BASE_SPEED = 500

func isHost():
	return multiplayer.get_unique_id() == 1
		
# Called when the node enters the scene tree for the first time.
func _ready():
	launch_ball()
	if GameManager.online:
		$MultiplayerSynchronizer.set_multiplayer_authority(1)

func getInitalDirection():
	return Vector2([-1,1].pick_random(), [-1,1].pick_random()) * BASE_SPEED
	
func launch_ball():
	global_position = get_viewport_rect().size / 2
	direction = getInitalDirection()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if GameManager.online && !isHost():
		return
	
	global_position += direction * delta


func _on_body_entered(body: CharacterBody2D):
	direction.x *= -1
	var palletShape: CollisionShape2D = body.get_child(0)
	var palletHeight = palletShape.shape.get_rect().size.y
	
	var distance = ( body.position - position).y / (palletHeight / 2)
	print(distance)
	direction.y += body.velocity.y * abs(distance)
