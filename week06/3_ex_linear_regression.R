# For this project you will be doing the Bike Sharing Demand Kaggle challenge! 
# 목적 : count 를 예측할 것입니다. 즉, 날씨에 따른 쉐어링 카운트.

# 1. Read in 'bikeshare.csv' file and set it to a dataframe called bike.

bike <- read.csv('bikeshare.csv')


# 2. Check the head of bike
head(bike)  
  
  
# 3. scatter plot of count vs temp. Set a good alpha value. 
# (ggplot)
library(ggplot2)
ggplot(bike, aes(x=temp, y=count)) + geom_point(aes(color=temp))
  
  
# 4. 문자열 시간으로 되어있는 컬럼을, R이 처리할 수 있는 시간으로 바꾸세요.
# hint : as.POSIXct(bike$datetime)
str(bike)
bike$datetime <- as.POSIXct(bike$datetime)

str(bike)

bike$weekday <- weekdays( bike$datetime )

# 5. 다음은 그냥 실행하세요. 
# 날짜별 쉐어링 카운트를 차트로 표시하는 코드.
ggplot(bike,aes(datetime,count)) + geom_point(aes(color=temp),alpha=0.5)  + scale_color_continuous(low='#55D8CE',high='#FF6E2E') +theme_bw()



# 6. temp와 count 간의 상관계수를 구하세요.
cor.bike <- cor( bike[  , c('temp','count')] )
corrplot(cor.bike)
corrgram(bike)

# 7. 데이터셋을 트레이닝과 테스트셋으로 분리하세요. 80:20
library(caTools)
set.seed(123)
split <- sample.split(bike$count, SplitRatio = 0.8)
training_set <- subset(bike, split == T)
test_set <- subset(bike, split == F)

# 8. temp에 따른 count를 예측하는 리니어 리그레션 모델을 만드세요.

temp.model <- lm(formula = count ~ temp, data = training_set)
  
  
# 9. Get the summary of the temp.model
summary(temp.model)  
  
# 10. 전체 요소에 따른 count를 예측하는 모델을 만드세요.
model <- lm(formula = count ~ ., data = training_set)  
summary(model)  
  
# 11. 그리고 백워드 엘리미네이션을 이용해서 모델을 최적화 하세요.

backwardElimination <- function(x, sl){
  numVars <- length(x)
  for(i in c(1:numVars)){
    regressor <- lm(formula = count ~ . , data = x)
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
  
# 12. 최적 모델에 대해서, 테스트셋으로 예측한 결과를 보여주세요.
regressor <- lm(count ~ datetime + holiday + weather +
                  atemp + humidity +casual +registered,
                data = training_set)

y_pred <- predict(regressor, newdata = test_set)

# 13. 실제 결과값과, 예측한 결과값을 하나로 합쳐서 보여주세요.

results <- cbind(test_set, y_pred)
















