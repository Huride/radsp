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





