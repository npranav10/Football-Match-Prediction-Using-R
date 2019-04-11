require(randomForest)
dataset = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/final_dataset.csv")
attach(dataset)
dataset.rf=randomForest(FTR ~ . , data = dataset)
train = dataset[c(3,4,7,39,40,41,42,43)]
trainset = dataset[c(3,4,7,39,40,41,42,43)]
train=sample(1:nrow(trainset),6080)
dataset.rf=randomForest(FTR ~ . , data = trainset , subset = train)
dataset.rf
plot(dataset.rf)
summary(plot(dataset.rf))
importance(fit)