
#  1: 다음처럼 동작하는 함수 작성. 
# string argument로 이름을 넣으면, 
# 다음처럼 "Hello name" (입력한 이름) 출력하는 함수

hello.name <- function(name){
  print(paste('Hello', name))
}

hello.name('홍길동')

# 3: 두 수를 입력하면, 두수의 곱을 반환하는 함수.
mul <- function(num1, num2){
  ret <- num1 * num2
  return(ret)
}

mul(3, 5)

# 4: 정수와 벡터를 입력받는 함수로서, 
# 해당 정수가 벡터에 존재하면 TRUE를 반환하고 
# 그렇지 않으면 FALSE를 리턴하는 함수 

# 호출 예) num_check(4,c(1,2,3))
num_check <- function(number, vec){
  for( data in vec){
    if(data == number){
      return(TRUE)
    }
  }
  return(FALSE)
}

num_check(3, 7:20)

# 5: 정수와 벡터를 입력받는 함수로서, 
# 정수가 벡터안에 몇개가 있는지 카운트 하는 함수 작성. 
# 몇개인지를 리턴하는 함수.

# 호출 예) num_count(3,c(1,1,2,2,3,3))   
#          2

# 벡터에서 원소 하나씩 끄집에 내서, number랑 비교해서,
# 같으면, cnt 하나씩 증가 시킨다.


num_count <- function(number, vec){
  cnt <- 0  
  for(data in vec){
    if(data == number){
      cnt <- cnt + 1
    }
  }
  return(cnt)
}

num_count(234, c(1,1,2,3,3,3,3,5,5,100,22,22,22,22,22))
# 6: 3 integer 를 입력하면, 합을 리턴하는 함수이되,
# 세 수 중에 3의 배수가 있으면, 3의배수는 합에 계산하지 않는다.
# 3 수가 모두 3의 배수면 0이다.

# 3개의 변수를 전달받아서, 하나씩 3의 배수인지 확인하여,
# 3의 배수가 아니면, 변수하나 만들어서 합하여 저장한다.
summer <- function(num1, num2, num3){
  my.sum <- 0
  if(num1 %% 3 != 0){
    my.sum <- my.sum + num1
  }
  if(num2 %% 3 != 0){
    my.sum <- my.sum + num2
  }
  if(num3 %% 3 != 0){
    my.sum <- my.sum + num3 
  }
  print(my.sum)
}

# 예) 
summer(7,2,3)
# 9
summer(3,6,9)
# 0
summer(9,11,12)
# 11

