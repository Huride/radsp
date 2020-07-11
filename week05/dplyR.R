# install.packages('dplyr')

library(dplyr)


install.packages('nycflights13')
library(nycflights13)

df <- flights

summary(df)
str(df)

weekdays( df$time_hour )

df <- as.data.frame(df)

str(df)

df$days <- weekdays( df$time_hour )


filter <- df$month == 11

df.11 <-  df[ filter,  ]

# dplyr filter() 함수

df.dply.11 <- filter(df, month == 11)

## 11월 3일의, carrier 가 AA 인 데이터만 가져오시오.
filter <- df$month == 11 & df$day == 3 & df$carrier == 'AA'
df[ filter  ,  ]

filter(df, month == 11, day == 3, carrier == 'AA')

# 슬라이싱.
df[ 5:10 , ]

slice(df, 5:10)

# 컬럼 데이터 가져오기.

# carrier, arr_time, arr_delay
df2 <-  df[  , c('carrier','arr_time','arr_delay')]

df3 <- select(df, carrier, arr_time, arr_delay)

##  11월 3일의 carrier 가 'AA'인 데이터 중,
##  arr_delay와 dep_delay 값을 가져오시오.
filter <- df$month == 11 & df$day == 3 & df$carrier == 'AA'
df.4 <-  df[ filter  ,  c('arr_delay', 'dep_delay')  ]

df.5 <- filter(df, month == 11, day == 3, carrier == 'AA')
df.6 <- select(df.5, arr_delay, dep_delay)

## 정렬
# 년도로 정렬하고, 월로 정렬, 날짜로 정렬, arr_time으로 정렬

sorted.df <- arrange(df, year, month, day, arr_time)

# 년도, 월은 내림차순, 날짜 내림차순, arr_time
sorted.df <- arrange(df, year, desc(month), desc(day),arr_time )

# 컬럼이름 변경함수.

# carrier => airline_carrier 로,  origin => ori 
df.rename <- rename(df, airline_carrier = carrier, ori = origin )

# 중복 데이터를 유니크 한 값으로 

## carrier 가 도대체 몇개이며 어떤것들이냐?
distinct(  select(df, carrier) )

distinct(  select(df, origin) )

# 데이터를 무작위(Random 랜덤)으로 뽑기.

sample_n(df, 10)

sample_frac(df, 0.1) # 10% 

sample_frac(df, 0.01)

# 컬럼만드는 함수 mutate

# diff 컬럼 :  arr_delay - dep_deplay

df$diff <- df$arr_delay - df$dep_delay

df.new <- mutate(df, diff = arr_delay - dep_delay)

# 수치형 데이터에 대한 요약 통계
summary(df)

mean( df$dep_time, na.rm = TRUE )
max( df$dep_time , na.rm = TRUE)
sum(df$dep_time, na.rm = TRUE)
min(df$dep_time, na.rm = T)

# 월별로 비행시간의 토탈값.
df.month <- group_by(df, month)

df.month.sum <- summarise(df.month, 
                          total_time = sum(air_time, na.rm = T))

# 월별로 dep_delay 의 평균.
df.month <- group_by(df, month)
df.mon.delay <- summarise( df.month  ,
                           avg = mean(dep_delay, na.rm = T))

df.mon.delay[ df.mon.delay$avg == max(df.mon.delay$avg),   ]

df.mon.delay <- summarise( df.month  ,
                           avg = mean(dep_delay, na.rm = T),
                           total = sum(dep_delay, na.rm = T))

arrange(df.mon.delay, desc(avg))

### 이어서 이어서 작업하는것을 편하게 해주는 방법.
### pipe 연산 => 단축키 ctrl+shift+m  =>   %>% 

df <- mtcars

# mpg 가 20보다 큰 데이터에서, 무작위로 5개의 데이터만 뽑아서,
# mpg의 내림차순으로 정렬하시오.

my.mpg <- filter(df, mpg > 20)

my.mpg.5 <- sample_n(my.mpg, 5)

arrange(my.mpg.5, desc(mpg))

# 파이프 연산 이용.
df %>% filter(mpg >20) %>% sample_n(5) %>% arrange(desc(mpg))








