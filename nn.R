
dataset = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/final_dataset.csv")
test = read.csv("D:/SEMESTER V/B1_ECM2002/J/Football-Data-Analysis-and-Prediction-master/Football-Data-Analysis-and-Prediction-master/Datasets/test.csv")

#Pre-Processing
str(dataset)
library(clusterSim)
dataset = data.frame(lapply(dataset, function(x) as.numeric(x)))
dataset = data.Normalization (dataset,type="n4",normalization="column")

test = data.frame(lapply(test, function(x) as.numeric(x)))
test = data.Normalization (test,type="n4",normalization="column")
# n 4 = (x - min(x) )/ range(x)

# Neural Networks
library(neuralnet)
set.seed(319)
#nn <- names(data)
#formula = as.formula(paste("FTR ~", paste(nn[!nn %in% "FTR"], collapse = " + ")))
#formula

# 5 neurons hidden layer
n = neuralnet(FTR ~ X + Date + HomeTeam + AwayTeam + FTHG + FTAG + HTGS + ATGS + 
                HTGC + ATGC + HTP + ATP + HM1 + HM2 + HM3 + HM4 + HM5 + AM1 + 
                AM2 + AM3 + AM4 + AM5 + HomeTeamLP + AwayTeamLP + MW + HTFormPtsStr + 
                ATFormPtsStr + HTFormPts + ATFormPts + HTWinStreak3 + HTWinStreak5 + 
                HTLossStreak3 + HTLossStreak5 + ATWinStreak3 + ATWinStreak5 + 
                ATLossStreak3 + ATLossStreak5 + HTGD + ATGD + DiffPts + DiffFormPts + 
                DiffLP,data = dataset,hidden = 5,err.fct = "ce",linear.output = FALSE)


# Prediction
output <- compute(n, dataset[,-7])
head(output$net.result)
head(dataset[1,])


# Confusion Matrix & Misclassification Error - training data
output <- compute(n, dataset[,-7])
p1 <- output$net.result
pred1 <- ifelse(p1>0.5, 1, 0)
tab1 <- table(pred1, dataset$FTR)
tab1
sum(diag(tab1))/sum(tab1)

# Confusion Matrix & Misclassification Error - testing data
output <- compute(n, test[,-7])
p2 <- output$net.result
pred2 <- ifelse(p2>0.5, 1, 0)
tab2 <- table(pred2, test$FTR)
tab2
sum(diag(tab2))/sum(tab2)
