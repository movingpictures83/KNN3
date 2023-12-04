library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)
library(mlbench)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
   trainfile <<- paste(pfix, parameters["train", 2], sep="/")
   testfile <<- paste(pfix, parameters["test", 2], sep="/")
}

run <- function() {}

output <- function(outputfile) {
myTrain <- read.csv(trainfile)
myTest <- read.csv(testfile)
trainClass <- myTrain["Class"]
testClass <- myTest["Class"]
centerScale <- preProcess(myTrain)
training <- predict(centerScale, myTrain)
testing <- predict(centerScale, myTest)
knnFit <- knn3(training, as.factor(trainClass$Class), k=11)
print(knnFit)
}
