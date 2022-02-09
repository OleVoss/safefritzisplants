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

func game_over():
	$MobTimer.stop()

func new_game():
	$MobTimer.start()
	print("New game started")
	score = 0


func _on_MobTimer_timeout():
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()

	var mob = mob_scene.instance()
	add_child(mob)

	var direction = mob_spawn_location.rotation + PI / 2

	mob.position = mob_spawn_location.position

	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction

	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
