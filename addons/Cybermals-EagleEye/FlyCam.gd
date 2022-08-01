extends Camera

export (float) var move_speed = 8
export (float) var look_speed = 128

onready var look_vec = get_rotation()


func _ready():
	#Enable event handling
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	#Ignore input if not current
	if not is_current():
		return
		
	#Handle input
	var move_vec = Vector3()
	
	if Input.is_action_pressed("move_forward"):
		move_vec.z = -1
		
	elif Input.is_action_pressed("move_backward"):
		move_vec.z = 1
		
	if Input.is_action_pressed("move_left"):
		move_vec.x = -1
		
	elif Input.is_action_pressed("move_right"):
		move_vec.x = 1
		
	if Input.is_action_pressed("move_up"):
		move_vec.y = 1
		
	elif Input.is_action_pressed("move_down"):
		move_vec.y = -1
		
	if Input.is_action_pressed("look_left"):
		look_vec.y += -look_speed * delta
		
	elif Input.is_action_pressed("look_right"):
		look_vec.y += look_speed * delta
		
	if Input.is_action_pressed("look_up"):
		look_vec.x += -look_speed * delta
		
	elif Input.is_action_pressed("look_down"):
		look_vec.x += look_speed * delta
		
	#Update movement
	#set_rotation(get_rotation() + look_vec * look_speed * delta)
	set_rotation(Vector3())
	rotate_y(deg2rad(look_vec.y))
	rotate_x(deg2rad(look_vec.x))
	set_translation(get_translation() + move_vec.rotated(Vector3(0.0, 1.0, 0.0), deg2rad(look_vec.y)) * move_speed * delta)
