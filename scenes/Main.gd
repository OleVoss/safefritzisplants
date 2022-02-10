extends Node2D

export(PackedScene) var mob_scene
var score
var running

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	running = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("start") and not running:
		$"HUD/Start label".hide()
		running = true
		new_game()

	if $Plant.hp == 0:
		game_over()

func game_over():
	$MobTimer.stop()
	running = false
	$"HUD/Start label".show()
	get_tree().call_group("mobs", "queue_free")

func new_game():
	$MobTimer.start()
	print("New game started")
	$Plant.reset()
	score = 0


func _on_MobTimer_timeout():
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()

	var mob = mob_scene.instance()
	add_child(mob)

	var direction
	if mob_spawn_location.position.y < $Plant.position.y:
		direction = mob_spawn_location.get_angle_to($Plant.position)
	else:
		direction = $Plant.get_angle_to(mob_spawn_location.position) - PI

	mob.position = mob_spawn_location.position


	mob.rotation = direction

	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)


func _on_Player_body_entered(body):
	print("bug kill")
	score += 1
	body.queue_free()
	$HUD.set_score(score)
