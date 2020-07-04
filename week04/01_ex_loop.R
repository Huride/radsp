# 1 : 유저가 입력한 숫자에 해당되는, 
# 구구단을 하는 프로그램을 작성하세요. hint: readline
# 입력 ) 단을 입력하세요 : 3
# 출력 ) 3 X 1 = 3

step <- readline(prompt = '단을 입력하세요 : ')

step <- as.numeric(step)

for( i in 1:9){
  print( paste(step, 'X', i, '=', step*i ))
}


# 2 : 유저한테 숫자를 5번 입력받으세요.
# 유저가 입력한 숫자들 중에서 음수의 갯수를 출력하세요.



for(i in 1:5){  # c(1,2,3,4,5)
  num <- readline(prompt = "숫자 입력 : ") 
  num <- as.numeric(num)
  if(num < 0){
    minus.count <-  minus.count + 1
  }
}
minus.count




# 3: 유저한테 숫자 5개를 입력받으세요.
# 유저가 입력한 숫자들을, 입력한 역순으로 출력하세요.
# hint : append

vec <- c()

for( i in 1:5){
  num <- readline(prompt = '숫자 입력 : ')
  num <- as.numeric(num)
  vec <- append(vec, num)
}

rev(vec)











