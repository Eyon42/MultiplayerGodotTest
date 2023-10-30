extends Node2D

var scores = {
	"p1": 0,
	"p2": 0
}
@export var PlayerScene : PackedScene
@export var Ball : PackedScene

signal  score_updated
# Called when the node enters the scene tree for the first time.
func _ready():
	var index = 0
	for i in GameManager.Players:
		var currentPlayer = PlayerScene.instantiate()
		currentPlayer.name = str(GameManager.Players[i].id)
		add_child(currentPlayer)
		var spawn_locations = get_tree().get_nodes_in_group("PlayerSpawnPoint")
		for spawn in spawn_locations:
			if spawn.name == str(index):
				currentPlayer.global_position = spawn.global_position
		index += 1
	var ball = Ball.instantiate()
	ball.name = "ball"
	add_child(ball)
	ball.launch_ball()
	
	GameManager.start_game()

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
		# area.queue_free()
		# var e = preload("res://world/ball/ball.tscn").instantiate()
		area.name = "ball"
		area.launch_ball()
		scores["p2"] += 1
		emit_signal("score_updated")
		# add_child(e)
		


func _on_right_area_entered(area):
	if area.get("isBall"):
		# area.queue_free()
		# var e = preload("res://world/ball/ball.tscn").instantiate()
		area.name = "ball"
		area.launch_ball()
		scores["p1"] += 1
		emit_signal("score_updated")
		# add_child(e)
