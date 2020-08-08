
dataset <- read.csv('bank_note_data.csv') 

sum(is.na(dataset))

str(dataset)

levels(as.factor(dataset$Class))

library(caTools)
set.seed(123)

split <- sample.split(dataset$Class , SplitRatio = 0.7)
training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == F)

library(neuralnet)
colnames(training_set)

nn <- neuralnet(formula = Class ~ Image.Var + Image.Skew +
                  Image.Curt + Entropy,
                data = training_set,
                hidden = c(10,20,10),
                linear.output = FALSE)
plot(nn)

y_pred <- compute(nn, test_set[ , -5])
y_pred

y_pred.ret <- y_pred$net.result
y_pred.ret

summary(dataset)

y_pred.class <- sapply(y_pred.ret, round)

y_pred.class

cm = table(test_set$Class, y_pred.class)
cm

#### Random Forest 랜덤 포레스트 : Decision Tree 개선 머신러닝.
## 분류: 로지스틱 리그레션, KNN, 디시젼트리, SVM, 랜덤포레스트, 딥러닝

install.packages('randomForest')
library(randomForest)

set.seed(123)

split <- sample.split(dataset$Class, SplitRatio = 0.7)

training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == F)

classifier <- randomForest(formula = Class ~ Image.Var + Image.Skew +
                             Image.Curt + Entropy,
                           data = training_set)

rf.pred <- predict(classifier, newdata = test_set[ , -5])
rf.pred

fr.pred.class <- sapply(rf.pred, round)

fr.pred.class

cm.rf <- table(test_set$Class, fr.pred.class)
cm.rf


(227+183) / sum(cm)


