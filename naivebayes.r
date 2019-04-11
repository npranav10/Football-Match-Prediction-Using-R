dataset = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/final_dataset.csv")
test = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/test.csv")
library('varhandle')
library('e1071',warn.conflicts=FALSE)
naive_bayes_model<-naiveBayes(FTR ~ ., data = dataset)
naive_bayes_predictions<-predict(naive_bayes_model, newdata=test)
naive_bayes_predictions
table(naive_bayes_predictions,test[,7])
mean(naive_bayes_predictions==test[,7])
