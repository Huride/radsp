seq(10,30)

seq(20,40,2)

v <- c(1,4,6,7,2,13,2)

# 오름차순 정렬
sort(v)

# 내림차순 정렬
sort(v, decreasing = TRUE)

v2 <- c('hello', 'hi', 'Mike', 'Harry', 'Banana')

sort(v2)
sort(v2, decreasing = TRUE)

v3 <- c('바나나', '배','수박','사과')

sort(v3)
sort(v3, decreasing = TRUE)

v

v <- append(v, 50)

v <- append(v , c(100,200,300) )

reversed.v <- rev(v)


## data structure 의 원소들에, 특정 함수를 적용하여,
## 값을 가공하고 싶을때

# 1차원 데이터
my.cal <- function(x){
  x <- (x + 10) * 2
  return(x)
}

# 첫번째 방법
my.cal(v)
# 두번째 방법
lapply(v, my.cal)  # l : list 의 약자, 즉, 결과가 리스트.
v2 <- sapply(v, my.cal)  # s : simple 의 약자, 즉, 결과가 벡터

# 2차원 데이터.

email <- c('abc@gmail.com', 'bbb@naver.com', 'ccc@daum.net')
comments <- c("Hello. It's good", "good~", 
              'This product is very good')

reply <- data.frame(email, comments)
reply

com.len <- sapply(reply$comments, nchar)
com.len

new.reply <- cbind(reply, com.len)
rownames(new.reply) <- 1:3

new.reply


reply

reply$com.len <- nchar(reply$comments)

reply

## apply 

M <- matrix(1:20, nrow = 5)
M

apply(M, 1, mean)

apply(M, 2, mean)

apply(M, 1, sum)

apply(M, 2, sum)




