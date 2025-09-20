extends CharacterBody2D

const SPEED := 900.0
const JUMP_VELOCITY := -900.0
# use project gravity so it matches RigidBody2D
const GRAVITY := 2500.0

func _physics_process(delta: float) -> void:
	# gravity pulls DOWN (positive y)
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# left/right using your actions
	var direction := Input.get_axis("left", "right")  # returns -1..1
	if direction != 0.0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

	move_and_slide()
