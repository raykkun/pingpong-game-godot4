extends CharacterBody2D
const SPEED : float = 600.0
@export var player_id : int
@export var score_label : Label
var score: int = 0
var start_position : Vector2
func _ready() -> void:
	start_position = position

func _physics_process(delta: float) -> void:
	var direction = 0
	
	if Input.is_action_pressed("up-%d" % player_id):
		direction -= 1
	if Input.is_action_pressed("down-%d" % player_id):
		direction += 1
	
	velocity.y = direction * SPEED
	velocity.x = 0
	move_and_slide()

func increment_score():
	# score one point
	score += 1
	# update the UI label 
	score_label.text = '%02d' %score

func reset():
	position = start_position
	velocity = Vector2.ZERO
