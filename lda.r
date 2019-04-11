dataset = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/final_dataset.csv")
test = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/test.csv")
library(MASS)
#lda.fit = lda(FTR ~ .,data=dataset)
lda.fit = lda(FTR ~ HomeTeam + AwayTeam + DiffPts+DiffLP+ DiffFormPts,data=dataset)
summary(lda.fit)
lda.pred=predict(lda.fit, test[-7,])
names(lda.pred)
lda.class=predict(lda.fit,test)$class
test[,7]
table(lda.class,test[,7])
mean(lda.class==test[,7])
