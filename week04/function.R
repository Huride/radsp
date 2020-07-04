# 함수 functions

v <- 4:23

# 함수의 호출,  function call 
sum(v)

sum <- function(){
  
}

mean(v)
length(v)

my.sum <- 0
for( data in v ){
  my.sum <- my.sum + data
}
my.sum




# hello 라고 화면에 출력하는 함수를 만들겠습니다.

# 함수의 정의
hello <- function(){
  print('hello')
}

hello()
hello()

# parameters , arguments  매개변수
hello.you <- function(name){  # name <- 'Mike'
  print(paste('hello', name))
}


hello.you('Mike')
hello.you('홍길동')

# 2 parameters 
cal.nums <- function(num1, num2){
  ret <- (num1 + num2) * 7
  print(ret)
}

cal.nums(3,4)
cal.nums(5)


order.num <- function(num1, num2, num3){
  print(paste(num1, num2, num3))
  print('bye')
}

order.num(1,2,3)
# 파라미터 이름을 명시하면, 해당 파라미터로 데이터 전달.
order.num(num2 = 1, num3 = 2, num1 = 3)



###### default parameters

hello.someone <- function(name = 'Mike'){
  print(paste('hello', name))
}

hello.someone('홍길동')
hello.someone()

readline()
readline(prompt = '숫자 입력 ')

### 디폴트 파라미터 2개





formal <- function(name = 'Sam', title){
  print(paste(title, name))
}


formal(title = "선생님")

formal()
formal('Harry')
formal(title='Mr')
formal('홍길동', '선생님')


times5 <- function(number){
  ret <- number ^ 5
  print(ret)
}

times5.new <- function(number){
  ret <- number ^ 5
  ret
}

times5.return <- function(number){
  ret <- number ^ 5
  return(ret)
}

result <- times5.return(2)






