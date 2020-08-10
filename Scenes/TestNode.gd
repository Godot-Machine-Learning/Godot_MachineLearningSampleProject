extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var simpleLR = SimpleLinearRegression.new()
var multiLR = MultipleLinearRegression.new()
func _ready():
	$SLR_Start_Train.connect("pressed",self,"SLRStartTrainingPressed")
	$SLR_CalculateOutput.connect("pressed",self,"SLRCalculateOutputPressed")
	simpleLR.connect("TrainingFinished",self,"SLRTrainingFinishedSlot")
	$MLR_Start_Train.connect("pressed",self,"MLRStartTrainingPressed")
	$MLR_Calculate_Output.connect("pressed",self,"MLRCalculateOutputPressed")
	
	

	print(simpleLR.TestFunc())
	
	
	print(multiLR.TestFunc())
	
	var naiveBC = NaiveBayesClassifier.new()
	print(naiveBC.TestFunc())

	var logRegression = LogisticRegression.new()
	print(logRegression.TestFunc())


func SLRStartTrainingPressed():
	simpleLR.SetInputs([2, 3, 5, 7, 9])
	simpleLR.SetOutputs([4, 5, 7, 10, 15])
	simpleLR.StartTraining()

func SLRCalculateOutputPressed():
	print(simpleLR.CalculateOutput(16))

func SLRTrainingFinishedSlot(input):
	print("Training Finished: ",input)


func MLRStartTrainingPressed():
	var Inputmatrix = [[110,40],[120,30],[120,30],[90,0],[80,10]]
	var outputMatrix = [100,90,80,70,60]
	for eachone in Inputmatrix:
		multiLR.InsertMultipleInput(eachone)
	multiLR.SetOutputs(outputMatrix)
	multiLR.StartTraining()

func MLRCalculateOutputPressed():
	var testInputMatrix = [110,40] 
	print(multiLR.CalculateForMultipleInput(testInputMatrix))

func MLRTrainingFinishedSlot(input):
	print("Training Finished: ",input)








