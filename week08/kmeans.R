# K-Means Clustering 군집 , 그룹핑

dataset <- read.csv('Mall_Customers.csv')

summary(dataset)

dataset[ dataset$Annual.Income..k.. == 137, ]

df <- dataset[ , 4:5]

set.seed(123)

ret.kmeans <- kmeans(x = df,
                     centers = 5)
y_kmeans <- ret.kmeans$cluster
y_kmeans

dataset <- cbind(dataset, y_kmeans)

dataset[ dataset$y_kmeans == 3, ]


library(cluster)
clusplot(df, 
         y_kmeans,
         lines = 0,
         shade = T,
         color = T,
         labels = 2,
         plotchar = F,
         span = T,
         main = 'Cluseters of Customers',
         xlab = 'Annual Income',
         ylab = 'Spending Score')


set.seed(6)

# k를 1부터 10까지 설정하고,
# 해당 k의 wcss 값을 구하여, wcss벡터에 저장할 것입니다.
# 그리고 나서 그래프로 표시.
wcss = c()

for( i in 1:10) {
  ret.kmeans <- kmeans(df, centers = i)
  wcss[i] <- sum(ret.kmeans$withinss)
}

wcss

# 엘보우 메소드를 이용해서, 최적의 k값을 찾는다.
plot(1:10,
     wcss,
     type = 'b',
     main = 'The Elbow Method',
     xlab = 'Number of clusters (K)',
     ylab = 'WCSS')


ret.kmeans <- kmeans(x = df, centers = 5)
y_kmeans <- ret.kmeans$cluster
y_kmeans









