
# linear regression : 수치 예측

dataset <- read.csv('Salary_Data.csv')

# 결측값 확인
sum(is.na(dataset))

# 트레이닝 셋, 테스트 셋 분리.

library(caTools)
set.seed(123)

split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split ==F)

# 리니어 리그레션은, 피쳐스케일링을 자체적으로 합니다.
# 따라서 저희가 피쳐스케일링 할 필요 없이,
# 모델에 넣어주면, 알아서 스케일링 합니다.

# 모델링.
colnames(training_set)

regressor <- lm(formula = Salary ~ YearsExperience,
                data = training_set)


summary(regressor)

# 검증 : 테스트셋.
y_pred <- predict(regressor, newdata = test_set)

y_pred

results <- cbind( test_set, y_pred )

library(ggplot2)

ggplot() + 
  geom_point(aes(x=training_set$YearsExperience, 
                 y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x=training_set$YearsExperience, 
                y=predict(regressor, newdata = training_set)),
            color = 'blue') + 
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of Experience') +
  ylab('Salary')

ggplot() + 
  geom_point(aes(x=test_set$YearsExperience, 
                 y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x=test_set$YearsExperience, 
                y=predict(regressor, newdata = test_set)),
            color = 'blue') + 
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of Experience') +
  ylab('Salary')
















