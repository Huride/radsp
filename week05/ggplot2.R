movies <- read.csv('Movie-Ratings.csv')

colnames(movies) <- c('Film', 'Genre','CriticRating',
                      'AudienceRating', 'BudgetMillions',
                      'Year')

str(movies)

distinct( select(movies, Genre) )
distinct( select(movies, Year))

movies$Year <- as.factor(movies$Year)

# install.packages('ggplot2')
library(ggplot2)

ggplot()

# 1. 데이터 레이어
ggplot(data = movies)

# 2. 에스테틱 레이어
colnames(movies)
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))

summary(movies)

# 3. 지오메트리 레이어.
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))+
  geom_point()

# 4. 칼라 셋팅 : Genre 를 컬러로 셋팅.
ggplot(data = movies, 
       aes(x = CriticRating, y = AudienceRating, color=Genre)) +
  geom_point()

# 5. 사이즈 셋팅
colnames(movies)
ggplot(data = movies, 
       aes(x = CriticRating, y = AudienceRating, 
           color=Genre, size = BudgetMillions)) + geom_point()

####
p <- ggplot(data = movies, 
            aes(x = CriticRating, y = AudienceRating, 
                color=Genre, size = BudgetMillions))

p + geom_point()

p + geom_line()

p + geom_point() + geom_line()

p + geom_line() + geom_point()

# 오버라이딩 : 원래 있던 값을, 내 입맛에 맞게 바꾸는것.

p + geom_point(aes(size = CriticRating) )

p + geom_point(aes(color = BudgetMillions))


# 축의 이름을 변경.

p + geom_point(aes(x= BudgetMillions)) + xlab("Budget Millions $")

## Setting / Mapping 
## 사이즈나 컬러를 컬럼으로 바꾸는 경우를 Mapping
## 그렇지 않은 경우를 Setting

r <- ggplot(data = movies, aes(x=CriticRating,
                               y=AudienceRating))
r + geom_point(aes(color = Genre))  # Mapping : aes 안에 설정.

r + geom_point(color = 'DarkGreen')  # Setting : aes없이 설정.

r + geom_point(aes(color = 'DarkGreen')) # 잘못된 예
r + geom_point(color = Genre) # 잘못된 예

r + geom_point(size = 15)

# point : 두 컬럼간의 관계 분석.
r + geom_point()

# Histogram 히스토그램 
s <- ggplot(data = movies, aes(x = BudgetMillions))

s + geom_histogram(bins=100)  # 빈의 갯수

s + geom_histogram(binwidth = 7) # 빈의 범위 0~7, 7~14

s + geom_histogram(binwidth = 10, fill = 'green')

s + geom_histogram(binwidth = 10, aes(fill=Genre), color='black')

# 덴서티 차트 (밀도)
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = 'stack')

# 트랜드 표시할때 사용하는 차트 
u <- ggplot(data = movies, aes(x=CriticRating, 
                                y=AudienceRating,
                                color = Genre))
u + geom_point() + geom_smooth()
u + geom_point() + geom_smooth(fill=NA)

# box plot : 2개 컬럼의 관계 
v <- ggplot(data = movies, aes(x=Genre,
                               y=AudienceRating,
                               color=Genre))
v + geom_boxplot()
summary(movies)

v + geom_boxplot() + geom_jitter()

v + geom_jitter() + geom_boxplot(alpha=0.3, size=1.3)

## facets 레이어.

z <- ggplot(data = movies, aes(x  = BudgetMillions))

z + geom_histogram(binwidth = 10, aes(fill=Genre), color='black')

# 행을 장르로.
z + geom_histogram(binwidth = 10, 
                   aes(fill=Genre), 
                   color='black') + facet_grid(Genre ~ .)

z + geom_histogram(binwidth = 10, 
                   aes(fill=Genre), 
                   color='black') + 
  facet_grid(Genre ~ .  , scales = 'free')


w <- ggplot(data = movies, aes(x=CriticRating,
                               y=AudienceRating,
                               color = Genre))
w + geom_point(size = 3) + facet_grid( Genre ~ . )

w + geom_point(size = 3) + facet_grid( Genre ~ Year )

### coodinates

p + geom_point()

# x축은 50~100 , y 축은 40~80 
p + geom_point() + xlim(50, 100) + ylim(40, 80)


## theme

a <- z + 
  geom_histogram(binwidth = 10, aes(fill=Genre),color='black')
# 축 이름 변경
a + xlab("Money Axis") + ylab("Number of Movies")

# 차트의 타이틀
a + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")

# 레이블 포맷팅
a + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(size=30, color = "DarkGreen"),
        axis.title.y = element_text(size=30, color = "Red"),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        plot.title = element_text(size=40, 
                                  color = "DarkBlue",
                                  family = 'Courier'))














