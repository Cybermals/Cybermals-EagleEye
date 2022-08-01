extends Node


func _ready():
	#Register cameras
	CameraManager.add_camera(get_node("FlyCam1"))
	CameraManager.add_camera(get_node("FlyCam2"))
	
	#Enable event handling
	set_process_input(true)
	
	
func _input(event):
	#Handle input
	if event.type == InputEvent.KEY and event.is_action_pressed("cam_1"):
		CameraManager.switch_camera("FlyCam1")
		
	elif event.type == InputEvent.KEY and event.is_action_pressed("cam_2"):
		CameraManager.switch_camera("FlyCam2")
