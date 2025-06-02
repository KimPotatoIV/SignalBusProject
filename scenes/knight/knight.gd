extends CharacterBody2D

##################################################
enum State {
	IDLE,
	RUN,
	JUMP
}

enum Direction {
	LEFT,
	RIGHT
}

const MOVING_SPEED: float = 300.0
const JUMP_VELOCITY: float = -600.0
const GRAVITY_SCALE: float = 2.0

var animated_sprite_node: AnimatedSprite2D

var state: State = State.IDLE
var direction: Direction = Direction.RIGHT

##################################################
func _ready() -> void:
	animated_sprite_node = $AnimatedSprite2D
	
	add_to_group("Knight")

##################################################
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * GRAVITY_SCALE * delta
		state = State.JUMP
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		SM.jump_sound_play()
	
	var get_input: float = Input.get_axis("ui_left", "ui_right")
	if get_input:
		velocity.x = get_input * MOVING_SPEED
		if is_on_floor():
			state = State.RUN
		if get_input > 0:
			direction = Direction.LEFT
		elif get_input < 0:
			direction = Direction.RIGHT
	else:
		velocity.x = move_toward(velocity.x, 0, MOVING_SPEED)
		if is_on_floor():
			state = State.IDLE

	set_state(state)
	move_and_slide()

##################################################
func set_state(state_value: State) -> void:
	match state_value:
		State.IDLE:
			animated_sprite_node.play("idle")
		State.RUN:
			animated_sprite_node.play("run")
		State.JUMP:
			animated_sprite_node.play("jump")
	
	if direction == Direction.LEFT:
		animated_sprite_node.flip_h = false
	else:
		animated_sprite_node.flip_h = true
