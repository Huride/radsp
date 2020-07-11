# dplyr 라이브러리를 사용할 겁니다.

library(dplyr)


# 1.  내장 데이터인 mtcars 데이터를 이용합니다. 
# 처음 6개 데이터를 출력하세요.
df <- mtcars
head(df)

# 2.mpg 가 20보다 크고실린더가 6 개인 데이터를 가져오세요.
filter(df, mpg > 20, cyl == 6)

# 3. 데이터를 먼저 cyl로 오름차순 정렬하고, 
# 해당 cyl은 wt의 내림차순 정렬합니다.
arrange(df, cyl,  desc(wt) )

# 4. Select the columns mpg and hp
select(df, mpg, hp)

# 5. Select the distinct values of the gear column.
distinct( select(df, gear) )

# 6. "Performance" 컬럼을 새로 추가합니다. 
# 이 컬럼은 hp 를 wt으로 나눈값입니다.
mutate(df, Performance = hp / wt)

# 7. Find the mean mpg value using dplyr.
summarise(df, avg = mean(mpg, na.rm = T), 
          sum = sum(mpg, na.rm = T))

# 8. Use pipe operators to get 
# the mean hp value for cars with 6 cylinders.
df %>% filter(cyl ==6) %>% summarise(avg=mean(hp, na.rm = T))







