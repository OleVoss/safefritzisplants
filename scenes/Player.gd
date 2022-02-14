extends Area2D

export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$CollisionShape2D.disabled = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	var look_at = velocity.normalized()
	look_at = cos(look_at.x) + sin(look_at.y)
	look_at(global_transform.origin + velocity)

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 115, screen_size.y)

	if Input.is_action_pressed("start"):
		$Spray.restart()


func _on_Player_body_entered(body):
	print("bug kill")
