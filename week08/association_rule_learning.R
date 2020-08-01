# association rule learning
# apriori 알고리즘

install.packages('arules')
library(arules)

dataset <- read.csv('Market_Basket_Optimisation.csv')

# 스파스 매트릭스로 데이터를 읽어온다.
dataset <- read.transactions('Market_Basket_Optimisation.csv', 
                             sep=',' ,
                             rm.duplicates = TRUE)
summary(dataset)

itemFrequencyPlot(dataset, topN = 20)

rules <- apriori(data = dataset, 
          parameter = list(support = 0.003,
                         confidence = 0.8))
# 위의 경우는 신뢰도가 높아서, 규칙을 못찾는 경우.

rules <- apriori(data = dataset, 
                 parameter = list(support = 0.004,
                                  confidence = 0.3))

# 정렬 후, 실제 규칙을 보는 함수
sorted.rules <- sort(rules, by='lift')

inspect( sorted.rules[1:10] )




(3/4)  /  (3/6)


