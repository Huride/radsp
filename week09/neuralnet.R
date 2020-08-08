install.packages('MASS')
library(MASS)

dataset <- Boston

maxs <- apply(dataset, 2, max)

mins <- apply(dataset, 2, min)

maxs
mins

scaled.data <- scale(dataset, center=mins, 
                      scale = maxs - mins)

summary(scaled.data)

install.packages('caTools')
library(caTools)

set.seed(123)

scaled.data <- as.data.frame(scaled.data)

split <- sample.split(scaled.data$medv, SplitRatio = 0.7)

training_set <- subset(scaled.data, split == T)
test_set <- subset(scaled.data, split == F)

install.packages('neuralnet')
library(neuralnet)

n <- colnames(training_set)

f <- as.formula(paste('medv ~ ', 
                      paste(n[!n %in% 'medv'],
                            collapse = '+')))
f

nn <- neuralnet(f, 
                data = training_set,
                hidden = c( 10, 7, 5),
                linear.output = TRUE)

nn

plot(nn)

predict.nn.values <- compute(nn, test_set[ , 1:13])

str(predict.nn.values)

predict.nn.values$net.result

# 스케일링 이전의 실제 값으로 작업.

true.predictions <- predict.nn.values$net.result *
  (max(dataset$medv) - min(dataset$medv)) + 
  min(dataset$medv)

true.predictions

# 테스트셋의 medv 도 실제 값으로 작업.
test.real <- test_set$medv * 
  (max(dataset$medv) - min(dataset$medv)) +
  min(dataset$medv)

test.real

## MSE : Minimum Sum of Squared Error

MSE.nn <-  sum( (test.real - true.predictions)^2 ) / nrow(test_set)

MSE.nn

true.predictions <- as.vector(true.predictions)

result <- cbind(test.real, y_pred = true.predictions)

install.packages('ggplot2')
library(ggplot2)

error.df <- data.frame(result)
colnames(error.df)

ggplot(error.df, aes(x=test.real, y=true.predictions)) + geom_point()


