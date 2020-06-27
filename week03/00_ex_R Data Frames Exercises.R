# 1. 다음과 같은 데이터프레임을 만드세요.
# https://docs.google.com/presentation/d/1vAFR3Gut5Kc4rS_D6qTZg1oasTEoPTuXBCKgt01BJ68/edit#slide=id.g80dc4e8050_0_0

Age <- c(22, 25, 26)
Weight <- c(150, 165, 120)
Sex <- c("M","M","F")

df <- data.frame(Age, Weight, Sex)
rownames(df) <- c("Sam", "Frank", "Amy")
df

# 2. mtcars는 1974 Motor Trend US Megazine에 수록된 차량과 차량에 관련된 수치들이 기록된 자료이다.
# 이 데이터셋을 가져와서, 데이터프레임인지 확인하시오.
df <- mtcars
is.data.frame(df)


# 3. 1~25까지 연속된 숫자로 행렬을 만드세요.
# 그리고 이 행렬을, 데이터프레임으로 변환하시오.
mat <- matrix(1:25, nrow = 5)
is.matrix(mat)
is.data.frame(mat)

df <- as.data.frame(mat)
is.data.frame(df)

# 4. mtcars 를 df 에 저장하세요. 아래 예제는 이 df 를 가지고 하겠습니다.
df <- mtcars

# 5. df의 처음 6행을 출력하세요.
head(df)
head(df, 10)

# 6. mpg(마일 퍼 갤런)의 평규값을 구하세요.
mean( df$mpg )

# 7. 6 cylinders (cyl column)를 가진 데이터를 뽑아내세요.
filter <- df$cyl == 6

new.df <- df[ filter  ,   ]

# 8. 다음 3개의 컬럼 am,gear, carb 만 나타내세요. 
df[  ,  9:11 ]

df[  ,  c('am','gear','carb') ]

# carb, gear, am 
df[  ,  c('carb', 'gear','am')]

# 9. 성능(performance)을 계산하여(hp/wt) 컬럼을 추가하세요.
df$performance <- df$hp / df$wt

# 10. 위의 performance 컬럼의 소수점을 두자리로만 맞추세요. hint: round함수
df$performance  <- round( df$performance, 2 )


# 11. hp가 100보다 크고 wt 가 2.5보다 큰 차량들에서, 
# 이 차량들의 평균 연비(mpg)가 얼마인지 보여주세요.
fliter <- df$hp > 100 & df$wt > 2.5

df[ fliter  ,   ]

mpg <- df[ fliter  , 'mpg'  ]

mean(mpg)

mean(df[ df$hp > 100 & df$wt > 2.5,  'mpg'])


# 12. Hornet Sportabout 차량의 연비(mpg)는??

df[ 'Hornet Sportabout'  ,   'mpg' ]




