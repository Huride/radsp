# vector, matrix, data.frame,   
# list => 리스트 하는 목적 : 데이터를 정리 / 저장 하는 용도

v <- 1:5
m <- matrix(1:10, nrow = 2)
df <- women

v
m
df

li <- list(v, m, df)
li

li[[1]]

li[[2]]

li[[3]]


li <- list( vec = v, score.mat = m, women = df)
li

li$vec

li$women

li[['women']]

li$women[ 6, 'weight' ]




