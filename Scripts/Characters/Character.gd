extends KinematicBody2D

export (float) var gravity = 9.8
export (float) var falling_multiplier = 1.4

var velocity = Vector2(0, 0)
var sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("AnimatedSprite")
	sprite.playing = true
	

func _physics_process(delta):
	if is_on_ceiling():
		velocity.y = 0

	if !is_on_floor():
		if velocity.y >= 0:
			velocity.y += gravity*falling_multiplier
		else:
			velocity.y += gravity
	
	var actual_velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if actual_velocity.x > 0:
		sprite.flip_h = false
		sprite.play("Run")
	elif actual_velocity.x < 0:
		sprite.flip_h = true
		sprite.play("Run")
	else:
		sprite.play("Idle")
		
	
