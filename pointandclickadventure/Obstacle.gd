extends StaticBody2D

onready var polygon = get_node("Polygon2D")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	polygon.color = Color(1,0,0,1)


func _on_Area2D_mouse_exited():
	polygon.color = Color(1,1,1,1)
