extends Node2D


var ball1
var ball2
var body1: RigidBody2D
var body2: RigidBody2D
var initialSpriteTransform: Transform2D

func init(ball1_, ball2_):
	ball1 = ball1_
	ball2 = ball2_
	body1 = ball1.get_node('RigidBody2D')
	body2 = ball2.get_node('RigidBody2D')
	$Sprite.modulate = ball1.modulate
	
	ball1.add_link(self)
	ball2.add_link(self)
func create_joint_():
	var j: DampedSpringJoint2D = DampedSpringJoint2D.new()
	j.set_length(
		body1.get_global_transform().get_origin().distance_to(body2.get_global_transform().get_origin())
	)
	#j.set_length(50)
	j.set_rest_length(10)
	j.set_node_a(body1.get_path())
	j.set_node_b(body2.get_path())
	j.set_damping(1)
	j.set_stiffness(1)
	j.set_bias(0.01)

	add_child(j)
	

func _ready():
	initialSpriteTransform = $Sprite.transform

func _process(delta):
	if (not body1) or (not body2):
		print ('link not initialized')
		return
	var p1: Vector2 = body1.get_global_transform().get_origin()
	var p2: Vector2 = body2.get_global_transform().get_origin()
	
	$Sprite.transform = Transform2D(
		(p2 - p1) / 512,
		(p2 - p1).rotated(PI / 2.0).normalized() * 0.5,
		p1
	)
	
func connects(ball):
	return ball1 == ball or ball2 == ball

func other_for(ball):
	if ball == ball1:
		return ball2
	else:
		return ball1

func destroy():
	ball1.remove_link(self)
	ball2.remove_link(self)
	get_parent().remove_child(self)




