# DEMOGRAPHIC ANALYSIS - 인구통계 분석


# 1. 파일을 읽기 위해서 디렉토리 경로 확인 및 설정.




# 2. 파일('demographic-data.csv')을 읽어서 변수에 저장하기.

data <-  
  
  

# 3. 기본적인 데이터 확인하기. (데이터 확인하는 기본 함수 4개 할용)

  
  

# 4. Year (년도) 컬럼의 값을 카테고리화 하여 사용하려 합니다.
# 즉 년도별로 데이터를 처리하기 위해서, 년도가 몇개로 되어있는지확인하세요.
# 저와 같이 하겠습니다. 




# 5. 이제, 년도값이 1960년도인 데이터와, 년도값이 2013년인 데이터.
# 이렇게 두개의 데이터프레임을 만드세요.

data1960 <-  
data2013 <-  

# 6. 각각의 데이터프레임은 몇개의 데이터(행)를 가지고 있는지 확인하세요.

  

# 7. '03_1_CountryRegionVectors.R' 파일을 열어서, 3개의 벡터를 메모리에 올리세요.
# 코드 작성 없습니다. 

  
# 8. 다음 데이터 프레임을 만듭니다. 
# 데이터프레임 이름 : add1960 
# 컬럼명 :           Code ,     Life.Exp 
# 위 컬럼의 데이터 : Country_Code, Life_Expectancy_At_Birty_1960

add1960 <- 


# 9. 다음 데이터 프레임을 만듭니다. 
# 데이터프레임 이름 : add2013
# 컬럼명 :           Code ,     Life.Exp 
# 위 컬럼의 데이터 : Country_Code, Life_Expectancy_At_Birty_2013

add2013 <- 
  

# 10. 위의 두 데이터프레임을 서머리 해 보세요.

  

# 10. data1960과, add1960 두 데이터프레임을 합쳐서 merged1960 으로 만듭니다. 
# (국가코드로 합치면 됩니다.)
# 마찬가지로 data2013과 add2013 두 데이터프레임을 merged2013으로 합칩니다.

merged1960 <- 
  
merged2013 <- 

# 11. 각각 구조를 확인해 보세요.


# 12. 이제 필요없는 컬럼인 Year 컬럼을 지웁니다. 
# 위의 두 데이터프레임 각각  Year 를 지우세요.



# 13. ggplot2 라이브러리를 사용하겠습니다. (아래 실행하세요.)
library(ggplot2)


# 14. 다음처럼 비주얼라이징 합니다. (아래 실행하세요)
# 출생률와 기대수명에 대해서 표시합니다.
# 스케터에 대해서는 비주얼라이징 단원에서 배우겠습니다.

qplot(data=merged1960, x=Fertility.Rate, y = Life.Exp, color=Region,
      size=I(5), alpha=I(0.6), main="Life Expectancy vs Fertility  1960")


qplot(data=merged2013, x=Fertility.Rate, y = Life.Exp, color=Region,
      size=I(5), alpha=I(0.6), main="Life Expectancy vs Fertility  2013")








