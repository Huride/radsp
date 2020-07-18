# Data Preprocessing Template

# 1. importing the dataset
dataset = read.csv('Data.csv')

# 2. NA 데이터가 있는지 확인하고, 처리.
any(is.na(dataset))

sum(is.na(dataset))

colSums(is.na(dataset))

# 처리하는 방법은 2 가지.
new.dataset <- na.omit(dataset)

new.dataset2 <- sapply(dataset, function(x) ifelse(
  is.na(x), 
  mean(x, na.rm = T), 
x))

# 3. 카테고리컬 데이터 처리.
dataset <- new.dataset

str(dataset)

# 먼저, 카테코리컬 데이터의 전체 유니크한 값을 구한다.
country.levels <- levels( as.factor(dataset$Country) )
length(country.levels)

dataset$Country <- factor(dataset$Country,
                          levels = country.levels,
                          labels = 1:length(country.levels))
str(dataset)

# y 컬럼의 카테고리컬 문자 데이터는, 
# 0과 1로 셋팅.(2개분류일때만)

dataset$Purchased <- factor(dataset$Purchased,
                            levels = c('No', 'Yes'),
                            labels = 0:1)

# 4. Splitting the dataset into Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123) # 랜덤의 시드값 설정. : 랜덤 패턴을 동일하게.
# 랜덤 패턴을 동일하게 하면, 다른 사람이 내가 만든 모델을
# 검증할 수 있다. 

split <- sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == F)

# 5. Feature Scaling : X 컬럼만 피쳐 스케일링 한다.

training_set[ , 2:3] <- scale( training_set[  , 2:3 ]  )

summary(training_set)

test_set[ , 2:3] <- scale( test_set[  , 2:3] )










