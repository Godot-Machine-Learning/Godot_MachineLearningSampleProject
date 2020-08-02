extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var test = 10
	var summer = NeuralNetwork.new()
	summer.add(10)
	print(summer.get_total())
	
	var simpleLR = SimpleLinearRegression.new()
	print(simpleLR.TestFunc())
	
	var multiLR = MultipleLinearRegression.new()
	print(multiLR.TestFunc())
	
	var naiveBC = NaiveBayesClassifier.new()
	print(naiveBC.TestFunc())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
