# 반복문 loop 
# 패턴을 발견하고, 바뀌는 부분, 바뀌지 않는 부분을
# 찾아서 프로그래밍.

x <- 1

while(x < 11){
  print(x)
  x <- x + 1
}





x <- 1

while(x < 11){
  print( paste('hello :', x) )
  
  if(x == 3){
    print('bye')
  }
  
  x <- x + 1
}

### break 문
x <- 1

while(x < 11){
  print( paste('hello :', x) )
  
  if(x == 3){
    print('bye')
    break
    # print('good')
  }
  
  x <- x + 1
}

# for loop

hello : 5
hello : 6
hello : 7
hello : 8
hello : 9
hello : 10

vec <- 5:100000 
for( data in vec){
  print(paste('hello :', data))
}


mat <- matrix(1:25, nrow = 5)

for( item in mat){
  print('hi')
  print(item)
}

mat

## Nested Loops 중첩 반복문

2 X 1 = 2
2 X 2 = 4
2 X 3 = 6
...
2 X 9 = 18
3 X 1 = 3
3 X 2 = 6
...


for( step in 2:9){   # c(2,3,4,5,6,7,8,9)
  for( i in 1:9 ){   # c(1,2,3,4,5,6,7,8,9)
    print( paste(step, 'X', i, '=', step*i ) )
  }
  print('------------')
}













