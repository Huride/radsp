# 다음과 같이 차트로 분석하려 합니다.
# https://docs.google.com/presentation/d/1vAFR3Gut5Kc4rS_D6qTZg1oasTEoPTuXBCKgt01BJ68/edit#slide=id.g81bf971d5e_0_22

library(ggplot2)

mov <- read.csv("21_ex-movie-Data.csv")


# 0. 데이터 먼저 파악하기.


# 1. 무슨요일에 많은지, 요일별로 데이터를 카운팅하여 바 플롯으로 나타낸다.



# 2. 장르는 'action', 'adventure', 'animation', 'comedy','drama' 인 데이터만 다루겠습니다. 
# filt 라는 변수 사용.



# 3. 스튜디오는 'Buena vista Studios', 'WB', 'Fox', 'Universal', 'Sony', 'Paramount Pictures' 
# 가  들어있는 데이터만 다루겠습니다.
# filt2 라는 변수 사용.



# 4. 위의 두 조건 filt, filt2 를 만족하는 데이터를 가져와서 mov2에 저장합니다.



# ggplt으로 x=Genre, y=Gross...US 으로 만듭니다.
# 5. 점으로 표현하는 geom_point()를 이용해서 차트를 그려보세요.



# 6. 박스플롯으로 차트를 그려보세요.



# 7. 위의 박스플롯과 더불어, 아웃라이어가 표시되도록, 분포를 점으로도 함께 나타내세요.



# 8. 위의 차트에서, 점으로 표시한 jitter 에, 
# 점의 사이즈를 조정하겠습니다. 
# 점의 크기는 예산의 크기인 Budget...mill. 으로 설정합니다.




# 9. 위의 차트에서, 점으로 표시한 jitter 에 색깔은 스튜디오 컬럼으로 설정합니다.




# 10. 박스플롯의 투명도를 0.7 로 설정하여, 점들을 흐리게 표시합니다.



# 11. x 레이블, y 레이블, 타이틀을 달아줍니다.
# x레이블은 Genre 로, y 레이브른 Gross % US 로 , 타이틀은 Domestic Gross % by Genre





# 12. 테마를 설정합니다.
# x 레이블 글자는 파란색, 사이즈는 30
# y 레이블 글자는 파란색, 사이즈는 30
# x 축 좌표의 크기를 20
# y 축 좌표의 크기는 20
# plot의 타이틀의 크기는 40 
# legend의 제목 크기는 20
# legend의 내용 글자 크기도 20
# 폰트는 "Comic Sans MS"로 설정.














# label의 제목 이름 바꾸기.







