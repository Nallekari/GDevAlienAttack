extends CharacterBody2D

@export var Speed = 300

var rocket_scene = preload("res://Scenes/rocket.tscn")

@onready var rocket_container = $RocketContainer


func _physics_process(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = Speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -Speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -Speed
	if Input.is_action_pressed("move_down"):
		velocity.y = Speed
	
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80

