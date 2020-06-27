empty <- data.frame()

c1 <- 1:10   # c(1,2,3,4,5,6,7,8,9,10)

c2 <- letters[1:10]

is.vector(c1)
is.vector(c2)
class(c1)
class(c2)

df <- data.frame(c1, c2)

df <- data.frame(num = c1, letter = c2)


d2 <- read.csv('example.csv')

head(d2)
tail(d2)
summary(d2)
str(d2)

nrow(df)
ncol(df)

colnames(df)

rownames(df)

df[ 4, ]

rownames(df) <- letters[1:10]
df[ 'g', ]

df[ 7,  ]

df[ 3:5 ,   ]

df[  , 2 ]

df$letter

cars <- mtcars

head(cars)

cars$mpg

sum(cars$mpg)
mean(cars$mpg)
max(cars$mpg)

### 행 추가 / 열 추가

df

df2 <- data.frame(num = 100, letter = 'hello')

df3 <- rbind(df, df2, df2, df)

df$newcol <- 101:110

df$mul <- df$num * df$newcol

df

colnames(df)[1]

colnames(df)[1]  <-  'score'
df


df.new <- df[ -6, ]


df[   ,  -3 ]

# 스코어가 6보다 큰 데이터.

filter <- df$score > 6

df[ filter  ,  ]

# 스코어는 6보다 크고, letter 가 i 인 데이터를 가져오시오.

filter <- df$score > 6 & df$letter == 'i'

df[filter ,   ]
# 스코어는 6보다 크고, letter 가 i 인 데이터에서 mul를
# 가져오시오.
df[filter,  'mul' ]

### 데이터프레임 처리하다보면, 데이터가 없는경우가 있습니다.
### 비어있는 데이터를 표현 : 결측값. NA / NAN 

is.na(df)

any(is.na(df))

sum(is.na(df))

colSums(is.na(df))




