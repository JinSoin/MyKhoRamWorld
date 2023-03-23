extends CharacterBody3D

@export var SPEED = 3.0 
@export var GRAVITY = 9.8
var Jump_Strenght = 4.5
	
func _handle_movement(delta):
	if !is_on_floor():
		velocity.y -= delta * GRAVITY
	var Input_Dir = Input.get_vector("Move_Left", "Move_Right", "Look_Up", "Crouch") 
	var Diraction = Vector3(Input_Dir.x, Input_Dir.y, 0)
	if Input.is_action_just_pressed("Jump_Up") and is_on_floor():
		velocity.y = Jump_Strenght
	velocity.x = Diraction.x * SPEED
	move_and_slide()
	
	# Set animation for Player
	$AnimationTree.set("parameters/conditions/Idle", Input_Dir == Vector2.ZERO && is_on_floor())
	$AnimationTree.set("parameters/conditions/Walking", Input_Dir != Vector2.ZERO && is_on_floor())
	$AnimationTree.set("parameters/conditions/Falling", ! is_on_floor())
	$AnimationTree.set("parameters/conditions/Landed", is_on_floor())
func _rotate_player(delta):	
	var angular_accelartion = 10
	$Armature.rotation.y = lerp_angle($Armature.rotation.y, atan2(-velocity.y, velocity.x), delta * angular_accelartion)
	
func _physics_process(delta):
	_handle_movement(delta)
	_rotate_player(delta)


	
	
	
