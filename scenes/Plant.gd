extends Area2D

signal hit

var hp

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 5
	$HpLabel.text = str(hp)

func start():
	$CollisionShape2D.disabled = false

func reset():
	hp = 5
	$HpLabel.text = str(hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("start"):
		print(position)

func _on_Plant_body_entered(body):
	emit_signal("hit")

func _on_Plant_hit():
	hp -= 1
	print("plant hit")
	$HpLabel.text = str(hp)
