extends Label
# Called when the node enters the scene tree for the first time.
func _ready():
	setScores()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_world_score_updated():
	setScores()

func setScores():

	var scores = get_node("/root/World").scores
	print(scores)
	text = str(scores["p1"]) + " - " + str(scores["p2"])
