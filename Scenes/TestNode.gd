extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var simpleLR = SimpleLinearRegression.new()
var multiLR = MultipleLinearRegression.new()
var naiveBC = NaiveBayesClassifier.new()
var logRegression = LogisticRegression.new()

func _ready():
	$SLR_Start_Train.connect("pressed",self,"SLRStartTrainingPressed")
	$SLR_CalculateOutput.connect("pressed",self,"SLRCalculateOutputPressed")
	simpleLR.connect("TrainingFinished",self,"SLRTrainingFinishedSlot")

	$MLR_Start_Train.connect("pressed",self,"MLRStartTrainingPressed")
	$MLR_Calculate_Output.connect("pressed",self,"MLRCalculateOutputPressed")
	multiLR.connect("TrainingFinished",self,"MLRTrainingFinishedSlot")

	$NaiveBayesClassifier_Start_Train.connect("pressed",self,"NBCStartTrainingPressed")
	$NaiveBayesClassifier_CalculateOutput.connect("pressed",self,"NBCCalculateOutputPressed")
	naiveBC.connect("TrainingFinished",self,"NBCTrainingFinishedSlot")

	$Logistic_Regression_Start_Train.connect("pressed",self,"LRStartTrainingButtonPressed")
	$Logistic_Regression_CalculateOutput.connect("pressed",self,"LRCalcualteOutputButtonPressed")
	logRegression.connect("TrainingFinished",self,"LRTrainingFinishedSlot")

	print(simpleLR.TestFunc())

	print(multiLR.TestFunc())

	print(naiveBC.TestFunc())
	
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

func NBCStartTrainingPressed():
	var Inputmatrix = [[6,180,12],[6,180,11],[6,170,12],[6,165,10],[5,100,6],[6,150,8],[5,130,7],[5,150,9]]
	var outputMatrix = [0,0,0,0,1,1,1,1]
	for eachone in Inputmatrix:
		naiveBC.InsertMultipleInput(eachone)
	naiveBC.SetOutputs(outputMatrix)
	naiveBC.StartTraining()

func NBCCalculateOutputPressed():
	var testInputMatrix = [6,130,8] 
	print(naiveBC.CalculateForMultipleInput(testInputMatrix))

func NBCTrainingFinishedSlot(input):
	print("Training Finished: ",input)


func LRStartTrainingButtonPressed():
	var Inputmatrix = [[6,180,12],[6,180,11],[6,170,12],[6,165,10],[5,100,6],[6,150,8],[5,130,7],[5,150,9]]
	var outputMatrix = [0,0,0,0,1,1,1,1]
	for eachone in Inputmatrix:
		logRegression.InsertMultipleInput(eachone)
	logRegression.SetOutputs(outputMatrix)
	logRegression.StartTraining()

func LRCalcualteOutputButtonPressed():
	var testInputMatrix = [6,130,8] 
	print(logRegression.CalculateForMultipleInput(testInputMatrix))

func LRTrainingFinishedSlot(input):
	print("Training Finished: ",input)
