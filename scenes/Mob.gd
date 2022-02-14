extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	if (rng.randf() < 0.9):
		linear_velocity = linear_velocity.rotated(1)
