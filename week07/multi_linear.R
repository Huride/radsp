
dataset <- read.csv('50_Startups.csv')

str(dataset)

states <- as.factor(dataset$State)
levels(states)

dataset$State <- factor(dataset$State,
                        levels= levels(states),
                        labels=1:3)

str(dataset)

library(caTools)

set.seed(123)

split <- sample.split(dataset$Profit, SplitRatio = 0.8)

training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == FALSE)


regressor <- lm(formula = Profit ~ . ,
                data = training_set)

summary(regressor)

y_pred <- predict(regressor, newdata = test_set)

y_pred

results <- cbind(test_set, y_pred)


backwardElimination <- function(x, sl){
  numVars <- length(x)
  for(i in c(1:numVars)){
    regressor <- lm(formula = Profit ~ . , data = x)
    maxVar <- max(coef(summary(regressor))[c(2:numVars),
                                           'Pr(>|t|)'])
    if(maxVar > sl){
      j <- which(coef(summary(regressor))[c(2:numVars),
                                         'Pr(>|t|)']==maxVar)
      x <- x[ , -j]
    }
    numVars <- numVars - 1
  }
  return(summary(regressor))
}

backwardElimination(training_set, 0.05)













