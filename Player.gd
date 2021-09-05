extends KinematicBody2D


var screen_size
const SPEED = 400
const JUMP_FORCE= -900
const GRAVITY = 30
var velocity = Vector2(0,0)  # The player's movement vector.
const FLOOR = Vector2.UP


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_FORCE
		
	velocity = move_and_slide(velocity, FLOOR)
	
	velocity.x = lerp(velocity.x, 0, .2)
