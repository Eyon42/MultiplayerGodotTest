extends CollisionShape2D

@export var side = "none"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_control_resized():
	if side == "bottom":
		position.y = get_viewport_rect().size.y + shape.extents.y
	if side == "rigth":
		position.x = get_viewport_rect().size.x + shape.extents.x
