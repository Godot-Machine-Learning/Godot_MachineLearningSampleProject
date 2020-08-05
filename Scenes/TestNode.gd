extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var simpleLR = SimpleLinearRegression.new()
func _ready():
	$SLR_Start_Train.connect("pressed",self,"SLRStartTrainingPressed")
	$SLR_CalculateOutput.connect("pressed",self,"SLRCalculateOutputPressed")
	simpleLR.connect("TrainingFinished",self,"SLRTrainingFinishedSlot")
	var test = 10
	var summer = NeuralNetwork.new()
	summer.add(10)
	print(summer.get_total())

	print(simpleLR.TestFunc())
	
	var multiLR = MultipleLinearRegression.new()
	print(multiLR.TestFunc())
	
	var naiveBC = NaiveBayesClassifier.new()
	print(naiveBC.TestFunc())

	var logRegression = LogisticRegression.new()
	print(logRegression.TestFunc())


func _process(delta):
	print("Processing..")


func SLRStartTrainingPressed():
	simpleLR.SetInputs([2, 3, 5, 7, 9])
	simpleLR.SetOutputs([4, 5, 7, 10, 15])
	simpleLR.StartTraining()

func SLRCalculateOutputPressed():
	print(simpleLR.CalculateOutput(16))

func SLRTrainingFinishedSlot(input):
	print("Training Finished: ",input)
