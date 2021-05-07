extends StaticBody2D

onready var polygon = get_node("Polygon2D")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hovered = false
var playerNearby = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hovered and Input.is_action_just_pressed("move_click") and playerNearby:
		print("Clicked")


func _on_Area2D_mouse_entered():
	polygon.color = Color(1,0,0,1)
	hovered = true


func _on_Area2D_mouse_exited():
	polygon.color = Color(1,1,1,1)
	hovered = false


func _on_Area2D2_body_entered(body):
	playerNearby = true


func _on_Area2D2_body_exited(body):
	playerNearby = false
