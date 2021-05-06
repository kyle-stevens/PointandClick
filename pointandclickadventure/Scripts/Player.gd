extends KinematicBody2D

export (int) var speed = 200

var target = Vector2()
var velocity = Vector2()
onready var line2d = get_node("Line2D")
onready var sprite = get_node("Polygon2D")
onready var camera = get_node("Camera2D")
func _ready():
	target = position


	
func _physics_process(delta):
	if Input.is_action_pressed("move_click"):
		target = get_global_mouse_position()
	if Input.is_action_pressed("stop_moving"):
		target = position
		line2d.set_point_position(1, Vector2(target.x - position.x, target.y - position.y))
	#not currently working :(
	if Input.is_action_just_released("scroll_zoom_in") and camera.zoom > 0.5:
		camera.zoom.x -= 0.01
	if Input.is_action_just_released("scroll_zoom_out") and camera.zoom < 1.5:
		camera.zoom.y += 0.01
	
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
		line2d.set_point_position(1, Vector2(target.x - position.x, target.y - position.y))
		sprite.look_at(target)
		
