
x <- 10

x < 20 

x > 5

x < 20 & x > 5


x == 2 & x > 1

x == 2 | x > 1

!(x > 10)

!!(x > 10)

# 조건문 

hot <- FALSE
temp <- 60

# temp가 40보다 크면, hot에 TRUE를 저장하겠다.

if (temp > 40) {
  hot <- TRUE
}

# temp가 40보다 크면, Hot 이라고 화면에 출력하고,
# 그렇지 않으면, Not Hot 이라고 출력하겠다.
temp <- 50

if (temp > 40 ){
  print('Hot')
} else  {
  print('Not Hot')
}

# temp가 80이상이면 , Hot 이라고 출력하고,
# 50이상 80미만이면, Nice 라고 출력하고,
# 32이상 50미만이면, Cool 라고 출력하고, 
# 위의 조건 아무것도 만족하지 않으면, Cold라고 출력.
temp <- 20
if(temp >= 80) { 
  print('Hot')
} else if ( temp >= 50 & temp < 80 ){
  print('Nice')
} else if (temp >= 32 & temp < 50 ){
  print('Cool')
} else {
  print('Cold')
}













