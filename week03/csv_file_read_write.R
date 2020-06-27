### csv 파일 : Comma Separated Values
###

ex <- read.csv('example.csv') 

head(ex)
summary(ex)
str(ex)
colSums(is.na(ex))

### 백만개 이상의 데이터를 읽어와야 한다.
# data.table
install.packages('data.table')
library(data.table)

df <- fread('example.csv')

df <- as.data.frame(df)

#### 저장.

# df 의 Name 컬럼 이름을 Nick.Name 으로 바꾸세요.

colnames(df)

colnames(df)[1] <- "Nick.Name"

write.csv(df, file = 'myfile.csv')

df <- read.csv('myfile.csv')
# 데이터프레임의 컬럼 없애는 방법
df <- df[ , -1] # 1번 방법
df$X <- NULL    # 2번 방법

df
## 저장할때부터, 행의 이름은 빼고 csv로 저장.

write.csv(df, file = 'myfile.csv', row.names = FALSE)

### 엑셀파일 읽기.
install.packages('readxl')
library(readxl)
# 설치 안되는경우 : jdk 1.8 download => 설치

df <- read_excel('Sample-Sales-Data.xlsx', sheet = 'Sheet1')

df <- as.data.frame(df)
df

## 라이브러리 설치 : 엑셀 저장.
install.packages('xlsx')
library(xlsx)
write.xlsx(df, "putput.xlsx")


###  35,000,000 이런 수치데이터 처리.
df <- read.csv('test.csv', sep = ';')
df
summary(df)

str <- "123,456,000"
gsub(",", "", str )

df$price <- as.numeric( gsub("," ,"" ,df$price ) )


df <- read.csv('test.csv', sep = ';')
df$price <- as.numeric( gsub("," ,"" ,df$price ) )

df

summary(df)


















