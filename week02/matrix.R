# 행렬 만들기.

v <- 1:10
v

matrix(v)

matrix(v, nrow = 5 )

matrix(v, nrow = 2)

matrix(v, nrow = 2, byrow = TRUE)



goog <- c(450, 451, 452, 445, 468)
msfg <- c(230, 231, 232, 236, 228)

goog
msfg

stocks <- c( goog, msfg )
stocks

stock.matrix <- matrix(stocks, nrow = 2, byrow = TRUE)
stock.matrix

rownames(stock.matrix) <- c('GOOG', 'MSFT') 

colnames(stock.matrix) <- c('Mon','Tue','Wed','Thu','Fri')

stock.matrix

# 행렬 연산.

mat <- matrix(1:50, nrow = 5, byrow = T)
mat

mat * 2

 1/ mat

mat / 2

mat ^ 2

mat > 17

mat + mat

mat * mat


stock.matrix

sum(stock.matrix)

rowSums(stock.matrix)
colSums(stock.matrix)

rowMeans(stock.matrix)
colMeans(stock.matrix)

stock.matrix

FB <- c(111, 112, 113, 120, 145)

stock.matrix <- rbind(stock.matrix, FB)
stock.matrix

Avg <- rowMeans(stock.matrix)
Avg

stock.matrix <- cbind(stock.matrix, Avg)
stock.matrix

# data selection 
mat[ 2,  ]
mat[  , 3 ]
mat[ 3 , 6 ]
mat[3,6] <- 100

mat[ 2:3, 6:8 ]

mat[  , c(2,4,7)]

