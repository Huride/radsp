# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Kernel SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Kernel SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[ , 3:5]

# Y값
dataset$Purchased <- factor(dataset$Purchased,
                            levels = c(0,1))
library(caTools)
set.seed(123)

split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == F)

training_set[ , -3] <- scale(training_set[ , -3])
test_set[ , -3] <- scale(test_set[ , -3])


library(e1071)
colnames(training_set)
classifier <- svm(formula = Purchased ~ Age+EstimatedSalary,
                  data = training_set,
                  kernel = 'radial') # rbf커널 : 가우시안 커널

y_pred <- predict(classifier, newdata = test_set[ , -3])

cm <- table(test_set$Purchased, y_pred)
cm

(58+32) / sum(cm)
# 정확도 0.9






