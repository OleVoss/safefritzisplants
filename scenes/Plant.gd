extends Area2D

signal hit

var hp

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Plant_body_entered(body):
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

