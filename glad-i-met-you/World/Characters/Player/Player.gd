extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var GRAVITY = 9.8

func _Handle_Player_Movement(delta): 
	if !is_on_floor():
		velocity.y -= delta * GRAVITY
	var Input_Dir = Input.get_vector("Move_Forward", "Move_Backward", "Look_Up", "Look_Down") 
	var Diraction = Vector3(Input_Dir.x, 0, 0)
	if Input.is_action_just_pressed("Jump_Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	velocity.x = Diraction.x * SPEED
	move_and_slide()
	
	# Set animation for Player
	$AnimationPackages/AnimationTree.set("parameters/conditions/Idle", Diraction == Vector3.ZERO && is_on_floor())
	$AnimationPackages/AnimationTree.set("parameters/conditions/Walking", Diraction != Vector3.ZERO && is_on_floor())
	$AnimationPackages/AnimationTree.set("parameters/conditions/Falling", ! is_on_floor())
	$AnimationPackages/AnimationTree.set("parameters/conditions/Landed", is_on_floor())
	
# Control Player Rotation
func _Player_Rot(delta):
	var angular_accelartion = 9.8
	$Player.rotation.y = lerp_angle($Player.rotation.y, atan2(-velocity.x, velocity.y), delta * angular_accelartion)

func _physics_process(delta):
	_Handle_Player_Movement(delta)
	_Player_Rot(delta)
	
