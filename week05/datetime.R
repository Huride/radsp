# "2020-03-03"   "2020-03-04 23:11:34"
# "04/11/2020"   "20-06-11"   "2020/05/11"

# 파일에 저장되어 있는 날짜들은?  문자열.
# R이 이해할 수 있는 날짜 형식으로 변환. => 요일, 125일 후는?
# 우리 회사 형식에 맞는 문자열로 바꿔서, 저장.

d <- Sys.Date()
d
class(d)
d + 137
weekdays(d)
weekdays(d+137)

# 2020,07,22
# R의 날짜 형식 Date를 , 문자열로 변환(우리 회사 형식에 맞게)
format(d, format="%Y,%m,%d")
# 2020==07?22
format(d, format="%Y==%m?%d")

format(d, format="%a")
format(d, format="%B")

format(d, format="%Y년 %m월 잘 되면 좋겠다.")

some.day <- d + 100

today <- "2020-07-11"

today + 100

class(d)
class(today)

some.day
weekdays(some.day)


t <- Sys.time()
t
class(t)

format(t, format = "%H시 %M분")

format(t, format = "%H시 하고 %M분 %S초")


my.date <- c("2020-07-02", "2020-08-12", "2020-07-14",
             "2020-09-22")
stock <- c(234, 567, 123, 333)

my.stock <- data.frame(my.date, stock)

str(my.stock)

stock.date <- my.stock[ 1 , 1 ]
stock.date <- as.Date(stock.date)
weekdays(stock.date)


class(my.stock$my.date)

my.stock$my.date <- as.Date( my.stock$my.date )

str(my.stock)

my.stock$days <- weekdays(my.stock$my.date)

my.stock[ my.stock$days == "화요일" ,   ]


# 11월

str(my.stock)

my.stock$month <- format( my.stock$my.date , format = "%m월")



my.date <- c("20년07월02일", "20년08월12일", 
             "20년07월14일", "20년09월22일")
stock <- c(234, 567, 123, 333)

new.df <- data.frame(my.date, stock)

new.df$iso <- as.Date( new.df$my.date , format = "%y년%m월%d일")




