
df <- read.csv('student-mat.csv', sep = ';')

sum(is.na(df))

num.cols <- sapply(df, is.numeric)

num.cols

num.df <- df[   ,  num.cols]

# 상관 관계 분석 / 상관 계수
# 상관 관계 분석에 필요한 다이어 그램 라이브러리 설치 
install.packages('corrgram')
library(corrgram)

install.packages('corrplot')
library(corrplot)

# 코플롯은, corr 값만 넣어야 합니다.
cor.data <- cor(num.df)   # 시험문제.
cor.data

print(corrplot(cor.data))
print(corrplot(cor.data, method = 'color'))

# corrgram 데이터프레임 직접 넣어도된다.

corrgram(df)
corrgram(df, order= T, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt)

library(ggplot2)
ggplot(df, aes(x=G3)) + geom_histogram(bins=20)

# 예측 모델링.

library(caTools)
set.seed(123)

split <- sample.split(df$G3, SplitRatio = 0.7)

training_set <- subset(df, split == T)
test_set <- subset(df, split ==F)

regressor <- lm(G3 ~ . , data = training_set)

plot(regressor)

y_pred <- predict(regressor, newdata = test_set)

results <- cbind(test_set, y_pred)

summary(regressor)

backwardElimination <- function(x, sl){
  numVars <- length(x)
  for(i in c(1:numVars)){
    regressor <- lm(formula = G3 ~ . , data = x)
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

backwardElimination(df, 0.05)








