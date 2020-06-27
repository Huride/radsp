
rm(i)
rm(step)

stats <- read.csv('edu-Demographic-Data.csv')

nrow(stats)
ncol(stats)

head(stats)
tail(stats)

str(stats)
summary(stats)

stats[ 3, ]
head(stats)

rownames(stats) <- stats$Country.Name

head(stats)
# 앙골라 데이터 가져오기
stats['Angola',  ]
# 앙골라의 출생률과 인터넷사용률 가져오기.
stats['Angola',  c('Birth.rate','Internet.users') ]

stats$Internet.users
# 인터넷 사용률에서 123번째 데이터 
stats$Internet.users[123]


# 20부터 30번째까지 데이터,
stats[ 20:30   ,  ]
stats$Country.Name

# 한국과 앙골라 두 나라의 데이터 비교.
stats[ c( "Korea, Rep.", 'Angola')  ,    ]

stats[1 ,  ]
# 데이터프레임 형식을 유지하면서, 컬럼의 값을 가져오는 방법
stats[  , 3 , drop = F ]

# 새로운 컬럼 만들기.
stats$My.col <- stats$Birth.rate * stats$Internet.users

# 
stats$test <- 1:5
str(stats)

v1 <- 1:12
v2 <- 10:32
v1
v2
v1 + v2
v3 <- 5:7
v1 + v3
length(v1)
length(v3)
length(v2)

# 컬럼 삭제.
stats$My.col <- NULL
stats$test <- NULL

# 필터링.
# 인터넷 사용률이 2보다 작은 나라들 찾기.
filter <- stats$Internet.users < 2
stats[ filter, ]

subset(stats, Internet.users < 2)

# 인터넷 사용률이 2보다 작거나 인컴그룹이 "Low income"인 나라 찾기.
filter <- stats$Internet.users < 2 | stats$Income.Group == 'Low income'
stats[ filter, ]

subset(stats, Internet.users <2 | Income.Group == 'Low income')

## 카테고리컬 데이터 처리
str(stats)

stats$Income.Group <- as.factor(stats$Income.Group)

str(stats)

levels( stats$Income.Group )

stats[ stats$Income.Group == "Lower middle income" ,   ]












