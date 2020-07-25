
dataset <- read.csv('adult_sal.csv')

dataset$X <- NULL

str(dataset)

levels(as.factor(dataset$type_employer))

#고용 안된 사람들만 묶는다.
un.emp <- function(job){
  if(job == "Never-worked" | job == "Without-pay"){
    return('Unemployed')
  }else{
    return(job)
  }
}

dataset$type_employer <- sapply(dataset$type_employer, un.emp)

levels(as.factor(dataset$type_employer))

group.emp <- function(job){
  if(job == "Federal-gov" | job=="Local-gov" | job=="State-gov"){
    return('gov')
  }else if(job == "Self-emp-inc" | job == "Self-emp-not-inc"){
    return('self-emp')
  }else{
    return(job)
  }
}
dataset$type_employer <- sapply(dataset$type_employer, group.emp)

table(dataset$type_employer)

table(dataset$marital)

group.marital <- function(mar){
  if(mar == 'Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
  }else if(mar == 'Never-married'){
    return('Never-married')
  }else{
    return('Married')
  }
}

dataset$marital <- sapply(dataset$marital, group.marital)

group.country <- function(country){
  if(country %in% Asia){
    return('Asia')
  }else if(country %in% North.America){
    return('North.America')
  }else if(country %in% Europe){
    return('Europe')
  }else if(country %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')
  }
}
dataset$country <- sapply(dataset$country, group.country)

dataset$type_employer <- as.factor(dataset$type_employer)
dataset$marital <- as.factor(dataset$marital)
dataset$country <- as.factor(dataset$country)

dataset[ dataset == '?' ] <- NA
table(dataset$type_employer)

str(dataset)
# ? 를 NA 로 바꿨지만, 아직 팩터에는 ? 가 남아있기 때문에,
# 팩터로 다시 변환시켜서 처리해줘야 한다.
dataset$type_employer <- sapply(dataset$type_employer, factor)
dataset$marital <- sapply(dataset$marital, factor)
dataset$country <- sapply(dataset$country, factor)

table(dataset$type_employer)

str(dataset)


colSums(is.na(dataset))

dataset <- na.omit(dataset)

levels.df <- levels(as.factor(dataset$income))
levels.df
dataset$income <- factor(dataset$income,
                         levels = levels.df,
                         labels = c(0,1))

library(caTools)
set.seed(123)
split <- sample.split(dataset$income, SplitRatio = 0.7)

training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == F)

classifier <- glm(income ~ . , 
                  family = binomial,
                  data = training_set)
summary(classifier)

# 컨퓨전 매트릭스 통해서, 정확도 계산





