# 와인 데이터가 있습니다. 화이트 / 레드와인
# 와인 정보를 삭제하고, k-means 이용해서 클러스터링 합니다.
# 실제 데이터와 얼마나 차이나는지 보겠습니다.

df1 <- read.csv('winequality-red.csv', sep = ';')
df2 <- read.csv('winequality-white.csv', sep = ';')

df1$label <- 'red'
df2$label <- 'white'

wine <- rbind(df1, df2)

install.packages('ggplot2')
library(ggplot2)

pl <- ggplot(wine, aes(x=residual.sugar)) +
  geom_histogram(aes(fill=label), color='black', bins = 50)

pl

summary(wine$residual.sugar)

pl + scale_fill_manual(values = c('#ae4554','#faf7ea')) +
  theme_bw()
## 알콜로 히스토그램.
pl2 <- ggplot(wine, aes(x=alcohol)) + 
  geom_histogram(aes(fill=label), color='black', bins=50)+
  scale_fill_manual(values = c('#ae4554','#faf7ea')) +
  theme_bw()
pl2

pl2 <- ggplot(wine, aes(x=citric.acid)) + 
  geom_histogram(aes(fill=label), color='black', bins=50)+
  scale_fill_manual(values = c('#ae4554','#faf7ea')) +
  theme_bw()
pl2


clus.data <- wine[  , -13]

wine.cluster <- kmeans(clus.data, centers = 2)
wine.cluster$centers

wine.cluster$cluster

wine <- cbind(wine, pred.group = wine.cluster$cluster)

table(wine$label, wine.cluster$cluster)


