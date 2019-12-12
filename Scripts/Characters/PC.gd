extends "res://Scripts/Characters/Character.gd"

export (float) var jump_power = 200
export (float) var jump_sustain = 3
export (float) var walk_speed = 120
export (float) var air_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func process_input():
	velocity.x = 0
	
	if Input.is_action_pressed("Left"):
		velocity.x = -1
	elif Input.is_action_pressed("Right"):
		velocity.x = 1
		
	if is_on_floor():
		velocity.x *= walk_speed
	else:
		velocity.x *= air_speed
		
	if Input.is_action_pressed("Up"):
		if is_on_floor():
			sprite.play("Jump")
			velocity.y = -jump_power
		else:
			if velocity.y < 0:
				velocity.y -= jump_sustain
	elif is_on_floor(): 
		velocity.y = 0

func _physics_process(delta):
	process_input()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
