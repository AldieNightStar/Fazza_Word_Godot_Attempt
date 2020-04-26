extends Node

class_name BaseControllerUtil

var _node : Node2D
var leftMethod : String
var rightMethod : String
var jumpMethod : String

var _error = false

func _init(node: Node2D, leftMethod: String, rightMethod: String, jumpMethod: String):
	self._node = node
	self.leftMethod = leftMethod
	self.rightMethod = rightMethod
	self.jumpMethod = jumpMethod
	if !(_node.has_method(leftMethod) && _node.has_method(rightMethod) && _node.has_method(jumpMethod)):
		print("Basic controller [" + str(_node) + "] has not all required methods!")
		_error = true
	if !_error:
		node.add_child(self)

func _process(delta):
	if !_error:
		if (Input.is_action_pressed("ui_left")):
			_node.call(leftMethod)
		elif Input.is_action_pressed("ui_right"):
			_node.call(rightMethod)
		if Input.is_action_pressed("ui_accept"):
			_node.call(jumpMethod)
