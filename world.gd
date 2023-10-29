extends Node2D

var scores = {
	"p1": 0,
	"p2": 0
}

signal  score_updated
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_top_area_entered(area):
	if area.get("isBall"):
		area.direction.y *= -1


func _on_bottom_area_entered(area):
	if area.get("isBall"):
		area.direction.y *= -1


func _on_left_area_entered(area):
	if area.get("isBall"):
		area.queue_free()
		var e = preload("res://ball.tscn").instantiate()
		scores["p2"] += 1
		emit_signal("score_updated")
		add_child(e)


func _on_right_area_entered(area):
	if area.get("isBall"):
		area.queue_free()
		var e = preload("res://ball.tscn").instantiate()
		scores["p1"] += 1
		emit_signal("score_updated")
		add_child(e)
