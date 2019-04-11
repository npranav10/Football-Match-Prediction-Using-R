library('varhandle')
dataset = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/final_dataset.csv")
test = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/test.csv")

library('party',warn.conflicts=FALSE)
ctree_model1<- ctree(FTR ~ ., data = dataset,controls=ctree_control(minsplit=30,minbucket=10,maxdepth=5))
ctree_predictions1 <- predict(ctree_model,data=test,type='response')
#ctree_prediction
round(mean(ctree_predictions==test$FTR),2)*100 

ctree_model2<- ctree(FTR ~ ., data = dataset)
ctree_predictions2 <- predict(ctree_model,data=test,type='response')
#ctree_prediction
round(mean(ctree_predictions==test$FTR),2)*100