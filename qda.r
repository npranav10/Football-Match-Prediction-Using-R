dataset = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/final_dataset.csv")
test = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/test.csv")
library(MASS)
qda.fit = qda(FTR ~ HomeTeam + AwayTeam + DiffPts+DiffLP+ DiffFormPts,data=dataset)
summary(qda.fit)
qda.class=predict(qda.fit,test)$class
table(qda.class,test[,7])
mean(qda.class==test[,7])