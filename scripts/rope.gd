extends Node2D

@export var node_a_path: NodePath
@export var node_b_path: NodePath

var node_a: Node
var node_b: Node

func _ready():
	if node_a_path:
		node_a = get_node(node_a_path)
	if node_b_path:
		node_b = get_node(node_b_path)

	if node_a and node_b:
		# Assuming Rope has PinJoints or Line2D logic
		$P1.node_a = node_a.get_path()
		$P2.node_b = node_b.get_path()
