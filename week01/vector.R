n <- 1
n2 <- 2

nvec <- c(1,2,3,4,5)

#  : (콜론)  =>    ~ 
# 1부터 5까지 =>  1 ~ 5 
# R에서는 1부터 5까지 =>  1 : 5

class(nvec)

cvec <- c('K', 'O', 'R', "E", 'A')
cvec
class(cvec)

lvec <- c(TRUE, FALSE, FALSE)
lvec
class(lvec)

# TRUE 는 컴퓨터에서 1, FALSE 는 0 
v <- c(FALSE, 2)
v
class(v)

v <- c('A', 10)
v
class(v)

pi
pi


temps <- c(19, 21, 23, 24, 18,22,25)
temps

# vector names
names(temps) <- c('Mon', 'Tue', 'Wed', 'Thu','Fri',
                  'Sat', 'Sun')
temps

temps[2]

temps['Fri']

my.first <- c(3, 45, 56, 73)
my.first
is.numeric(my.first)
is.integer(my.first)
is.double(my.first)

v2 <- c(3L, 12L, 243L, 0L)
is.numeric(v2)
is.integer(v2)
is.double(v2)

# 연속된 숫자 만들기.

v <- 1:30
v

v2 <- seq(1, 30)
v2

v3 <- seq(30)
v3


v4 <- 5:25
v4

v5 <- seq(5, 25)
v5

# seq함수는, step 을 넣을 수 있다.\
seq(5, 25, 5)

# 복사
rep(3, 100)

my.first

rm(v2)

v2

my.first

my.first <- my.first[-1]

my.first

v1 <- c(1,2,3)
v2 <- 5:7
v3 <- 11:14

v1 + 3
v1 * 3

v1 + v2 
v1 + v3

length(v1)
length(v3)

v1 * v2 

sum(v1)

sd(v1)

var(v1)

max(v1)

min(v1)


5 > 6

6 > 5

v1 <- 1:3
v2 <- c(10,20,30)

v1 < v2

v1 <- c(20, 10, 30)

v1 < v2

v1 != v2

x <- 100

x == 100

v1 == 40


v1 <- 1:100
v1[35]

# 35번째 데이터를 , 100으로 바꾸세요.
v1[35] <- 100

v1[35]
v1

# multiple indexing
v1[ c(40,45) ]

v1[ c(5,7,10) ]

v1[ c(35,40) ]

# Slicing   머 부터 머까지. 
# 20번째 데이터부터 40번째 데이터까지 가져오세.
#  20 : 40 

v1[ 20:40  ]

# Filtering
# 70보다 큰 데이터만 가져오시오.

filter <- v1 > 70

v1[ filter ]




















































