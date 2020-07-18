## 이것과 비슷한 차트를 그려봅니다.
## https://docs.google.com/presentation/d/1vAFR3Gut5Kc4rS_D6qTZg1oasTEoPTuXBCKgt01BJ68/edit#slide=id.g81bf971d5e_0_15


library(ggplot2)

# 1. Economist_Assignment_Data.csv 파일을 읽으세요.
df <- read.csv('Economist_Assignment_Data.csv')

df <- df[  , -1]

# 2. ggplot() + geom_point() 으로, CPI 와 HDI 의 분포를 비주얼라이징하세요.( color=Region )

pl <- ggplot(df, aes(x=CPI, y=HDI, color=Region)) +
  geom_point()
pl

# 3. 위의 점(point)를  larger empty circles 로 만드세요.
# hint : size, shape

pl <- ggplot(df, aes(x=CPI, y=HDI, color=Region)) +
  geom_point(size = 4, shape = 1)
pl
  
# 4. 위의 차트에다, 피팅(fitting)되는 
# 선(trend line) 을 추가하여 나타내세요.
# hint : geom_smooth

pl + geom_smooth(aes(group=1))
  

# 5. 다음 파라미터를 위에 추가해 보세요.
# method = 'lm'
# formula = y ~ log(x)
# se = FALSE
# color = 'red'

# 자세한 사용법은 https://ggplot2.tidyverse.org/reference/geom_smooth.html 참고.

pl2 <- pl + geom_smooth(aes(group=1) , 
                        method = 'lm',
                        formula = y ~ log(x),
                        se = F,
                        color ='red')
pl2  

# 6.  labels를 달겠습니다.
# geom_text를 이용하세요 : geom_text(aes(label=Country)) 

pl2 + geom_text(aes(label = Country))
  

# 7. 위의 문제점은, 너무 많은 텍스트가 표시됩니다. 
# 따라서 아래와 같은 나라들만, 레이블로  사용하겠습니다.
# hint : subset(df, Country %in% pointsToLabel) 

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

selected.country <- subset(df, Country %in% pointsToLabel)

selected.country <- df[ Country %in% pointsToLabel ,   ]

pl3 <- pl2 + geom_text(aes(label = Country) ,
                       data = selected.country,
                       color = 'gray20',
                       check_overlap = T)
pl3

# 8.  pl3 에  theme_bw() 를 추가해서 플롯을 나타내 보세요.

pl4 <- pl3 + theme_bw()

pl4  

#  x축 셋팅, y축 셋팅.
# 타이틀 셋팅
# 10. gg 테마 이용

pl5 <- pl4 + scale_x_continuous(
  name = "Corruption Perceptions Index",
  limits = c(0.9, 10.5),
  breaks = 1:10)
pl5

pl6 <- pl5 + scale_y_continuous(
  name = "Human development Index",
  limits = c(0.2, 1.0))

pl6

pl7 <- pl6 + ggtitle("Corruption and Human Development")

pl7

install.packages('ggthemes')
library(ggthemes)
pl7 + theme_economist_white()



