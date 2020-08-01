
dataset <- read.csv('Mall_Customers.csv')

df <- dataset[ , 4:5]

dendrogram <- hclust(d = dist(df, method = 'euclidean'),
                     method = 'ward.D')
plot(dendrogram,
     main = "Dendrogram",
     xlab = 'Customers',
     ylab = 'Euclidean Distances')


y_pred <- cutree(dendrogram, 5)

y_pred

result <- cbind(dataset, y_pred)


library(cluster)
clusplot(df, 
         y_pred,
         lines = 0,
         shade = T,
         color = T,
         labels = 2,
         plotchar = F,
         span = T,
         main = 'Cluseters of Customers',
         xlab = 'Annual Income',
         ylab = 'Spending Score')














