dataset = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/final_dataset.csv", header = TRUE)
test = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/test.csv", header = TRUE)

library("e1071")
library(caret)
# options(repos = c(CRAN = "http://cran.rstudio.com"))
# library(clusterSim)
# dataset = data.frame(lapply(dataset, function(x) as.numeric(x)))
# dataset = data.Normalization (dataset,type="n4",normalization="column")
# 
# test = data.frame(lapply(test, function(x) as.numeric(x)))
# test = data.Normalization (test,type="n4",normalization="column")


svm_model1 <- svm(FTR ~ .,kernel = "radial", data=dataset)
summary(svm_model1)
pred1 <- predict(svm_model1, newdata = test)
confusionMatrix(pred1, testing$FTR )

svm_model2 <- svm(FTR ~ .,kernel = "linear", data=dataset)
summary(svm_model2)
pred2 <- predict(svm_model2, newdata = test)
confusionMatrix(pred2, testing$FTR )

svm_model3 <- svm(FTR ~ .,kernel = "polynomial",degree = 3, data=dataset)
summary(svm_model3)
pred3 <- predict(svm_model3, newdata = test)
confusionMatrix(pred3, testing$FTR )

svm_model4 <- svm(FTR ~ .,kernel ="polynomial",degree = 5, data=dataset)
summary(svm_model4)
pred4 <- predict(svm_model4, newdata = test)
confusionMatrix(pred4, testing$FTR )