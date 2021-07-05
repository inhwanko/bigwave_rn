##############################################
#### 1. R Studio 환경을 내 것으로 만들기! ####
##############################################

# R을 구동하기 위해서는 크게 세 가지가 필요합니다
# R 스크립트 (.R 확장자 파일), 데이터 (여러 확장자 형태), 
# 그리고 이 두 가지가 들어가있는 폴더. aka "working directory"

# 실험실로 비유를 해보자면 working directory는 실험실,
# R 스크립트는 실험 도구 (전자현미경 등),
# 데이터는 실험 재료입니다 (세포배양액 등).

# 그 밖의 R Studio의 기능들을 누려봅시다.
# Global Option, Set Working Directory, Panes, Etc.


################################################################
#### 2. R과 친해지기- 계산기 ####

## R Script에 있는 코드를 실행하려면 Ctrl + Enter를 누르면 됩니다.
## 그럼 커서가 위치한 그 행의 코드가 실행됩니다

2+3
2-3
2*3
2/3

2/0 # 이 경우는?

4^2
sqrt(4) # 종종 이렇게 Base R의 함수를 사용할 수도 있습니다
# Base R: 아무 패키지 설치 없이 R 자체가 가지고 있는 고유 기능/함수들

(2*4*3) / 10
sqrt(2*2)

2(3+4) # 이건 왜 안 될까?

## 팩토리얼?
5! # ㅎㅎ
factorial(5)

## 순열조합? (머리가 아파오네요~)
5P2 # ㅎㅎ
factorial(5)/factorial(5-2)
factorial(5)/(factorial(5-2)*factorial(5-3))



################################################################
#### 3. R과 친해지기- 오브젝트 (객체) ####

## 이것도 무스비, 저것도 무스비 (feat. 너의 이름은)
## 이것도 객체, 저것도 객체 (feat. R)

4 # 값
four

four <- 4 # 오브젝트 (객체) 에 값을 배정
four

two <- 2

four + two
(four + two)^6 / (four-two)^2


kiyomi <- 1+1 # 이런 억지도 가능합니다
kiyomi <- 2+2
kiyomi <- 3+3

## 마지막에 배정된 값만을 객체는 기억한다는 점!
## 객체 이름을 다 따로 표시해주어야겠죠?

kiyomi_1 <- 1+1 # 비슷한 객체들의 variation을 표시할 때는 _나 .을 사용합니다
kiyomi_2 <- 2+2
kiyomi_3 <- 3+3

kiyomi_1^1 + kiyomi_2^2 + kiyomi_3^3
2^1 + 4^2 + 6^3

## 이전 kiyomi를 지워줍시다
rm(kiyomi)

## 현재까지의 모든 오브젝트를 지우려면?
rm(list=ls()) # 주의! 




################################################################
#### 4. 오브젝트의 종류- 벡터와 행렬 ####

# 벡터맨 아님 주의

## 벡터: 크기(length)와 방향(direction)을 갖는 물리량
vec_1 <- c(1, 2, 3) # 새로운 함수 c()
vec_1 # 방향은 1부터 3
length(vec_1) # 크기는 3개

vec_2 <- c(3, 2, 1) # 방향은 로꾸꺼, 크기는 그대로
vec_2
length(vec_2)

## 같은 원소를 동일해서 여러개 벡터로 만들고 싶다면?
rep(x=2, times=5)
rep(x=vec_1, times=5)

rep(2, 5) # x와 times라는 argument는 생략 가능

## 행렬: 수 또는 다항식 등을 직사각형 모양으로 배열한 것
# 위의 두 녀석들을 가로로 쌓으면 2x3 행렬
mat_1 <- rbind(vec_1, vec_2)
mat_1
dim(mat_1) #dimension의 줄임말: 행렬의 크기 몇?

# 이 녀석들을 세로로 쌓으면 3x2 행렬
mat_2 <- cbind(vec_1, vec_2)
mat_2
dim(mat_2)


## 행렬의 덧셈?
mat_1 + mat_2 # 2x3 행렬에는 2x3 행렬을 더해주어야
mat_1 + mat_1

## 행렬의 곱셈? 
# 2x3 행렬에는 3x2 행렬을 곱해주어야
mat_1 %*% mat_2 # 2x2 행렬이 되었따

# 3x2 행렬에는 2x3 행렬을 곱해주어야
mat_2 %*% mat_1 # 3x3 행렬이 되었따

## 행렬 안의 쪼꼬미들은 원소(element)라고 부릅니다
mat_1
mat_1[2,1]
mat_1[1,3]

## 벡터도 더할 수 있어요!
vec_1 + vec_2




################################################################
#### 4. 오브젝트의 종류- 문자(character)와 요인(factor) ####

## 단어
countrylist <- c("korea", "japan", "us")
countrylist
# 문자 오브젝트는 사칙연산이 불가능해요!

## 요인이란?
# 범주/순서가 있는 문자들의 조합
factorlist <- factor(c("very low", "low", "high", "very high"))
factorlist
orderlist <- ordered(c("very low", "low", "high", "very high"),
                     c("very low", "low", "high", "very high"))
orderlist


## 문장/문단도 문자 오브젝트에 해당!
opinion <- c("This is a very good movie. I'll watch it again.",
             "I don't think I'll watch this again.",
             "NA",
             "My best movie ever watched.")
opinion
opinion[1]

# 문장을 단어 별로 쪼개서 다른 오브젝트로 저장?
opinion_first <- strsplit(opinion[1], " ")




################################################################
#### 5. 오브젝트의 종류- 리스트(list) ####

## 현재까지의 오브젝트들의 종류를 어떻게 확인할까요?

class(2)
class(kiyomi_1)
class(vec_1)
class(mat_1)
class(cbind)
class(countrylist)
class(factorlist)
class(orderlist)

class(opinion_first)

## list는 다른 여러 종류의 오브젝트들이 합쳐져 있는 오브젝트
opinion_first[[1]]
opinion_first[[2]] <- orderlist[4]
opinion_first[[3]] <- 4

opinion_first


## 도전과제
# 1. 위의 opinion 오브젝트에서 두 번째 원소를 추출하여 opinion_second에 저장
# 2. orderlist 중 알맞은 원소를 추출하여 opinion_second의 두 번째 원소에 저장
# 3. 알맞은 숫자를 하나 지정하여 opinion_second의 세 번째 원소에 저장


## list는 우리가 언제 볼 수 있을까?
# 선형회귀분석의 결과는 list로 저장됨 (주요 통계 분석 결과도 마찬가지)
# 한 연구에서 여러 데이터프레임을 이용할 때 사용됨



################################################################
#### 5. 오브젝트의 종류- 데이터프레임(data frame) ####


## 우리가 통계분석을 할 때 가장 많이 사용하는 오브젝트, 데이터프레임

data <- data.frame(x=c(1,2,3,4),
                   y=c(1,0,1,0),
                   z=c(0,1,0,1))
data
# matrix랑 뭐가 다른거징 ㅇㅅㅇ

data <- data.frame(country=countrylist,
                   english=c(0,0,1),
                   asia=c(1,1,0))
data
# matrix와 같은 형식이나 원소들에 대한 더 많은 정보가 들어있음


# 데이터프레임을 불러올 때는 데이터 원자료 (파일)가 들어있는 폴더를
# working directory로 지정해주어야 함

getwd()
# setwd() 함수 안에 directory path를 지정해주거나 Ctrl + Shift + H 클릭
# 본 코드와 함께 다운받은 "solar2020.csv" 등 3개의 파일이 저장되어있는 폴더로 지정합시다


install.packages("readxl"); library(readxl)

data <- read_excel("solar2020.xlsx", sheet=1)

# 2020년 12월 31일 기준 전국 226개 기초지차체 태양광 현황
# 출처: 전력통계정보시스템 (EPSIS)

# 데이터 확장자 명에 따라 각기 다른 명령어/패키지가 있어요!
# 예컨대 csv파일이었다면
# data <- read.csv("solar2020.csv")


## 이쯤에서 소개하는 Base R에 이어 거의 하나의 "언어"체계를 이룬 패키지
## tidyverse

install.packages("tidyverse"); library(tidyverse)

######################## 여기가 제일 중요해요!! #################################

## 데이터를 불러오면 먼저 해야할 것
# 1. 변수명 (열이름) 을 확인한다
colnames(data)

# 2. 변수명을 영어로 적당히 바꿔준다
colnames(data) <- c("upper","lower","type","area","year","capa",
                    "small_no","large_no","kpxmember_no")

# 이후부터는 입맛에 맞게 데이터 탐색/가공


## 데이터 가공

# 1. 각 지자체 별 총 태양광발전소 갯수?

data$total_no <- data$small_no + data$large_no

# 2. 각 지자체 별 전력거래소 비회원사가 지은 태양광발전소 갯수?

data$nonkpx_no <- data$total_no - data$kpxmember_no

# 3. 각 지자체 별 전체 대비 전력거래소 비회원사가 지은 발전소 갯수 비중?

data$nonkpx_share <- (data$nonkpx_no / data$total_no) *100

# 4. 각 지자체 별 발전소 1기 당 설비용량(kw)?

data$capa_per_gen <- data$capa / data$total_no

# 5. 각 지자체 별 면적(km2) 당 설비용량(kw)?

data$capa_per_km2 <- data$capa / data$area

# 6. 각 지자체 별 면적(km2) 당 태양광 갯수?

data$no_per_km2 <- data$total_no / data$area


## 데이터 탐색

# 1. 2020년 기준 총 설비용량 (226개 지자체만 포함- 제주, 세종 제외)?

sum(data$capa) # 14.084 GW

# 2. 2020년 기준 전체 태양광발전소 갯수?

sum(data$total_no)

# 3. 2020년 기준 평균 발전소 1기 당 설비용량(kw)?

mean(data$capa_per_gen) # 왜 안 될까?
mean(data$capa_per_gen, na.rm=T) # 이건 된다. 그런데 올바른 계산법이 아님!

sum(data$capa) / sum(data$total_no)

# 4. 2020년 기준 평균 면적(km) 당 설비용량(kw)?

sum(data$capa) / sum(data$area)

# 5. 2020년 기준 평균 면적(km) 당 태양광 갯수?

sum(data$total_no) / sum(data$area)




## tidyverse를 활용하면 데이터 가공/탐색이 더욱 용이하다

# Base R의 문법: 영어와 유사
# tidyverse의 문법: 한국어와 유사
# https://tavareshugo.github.io/data_carpentry_extras/base-r_tidyverse_equivalents/base-r_tidyverse_equivalents.html

# 광역지자체 중 전남만 보고 싶다면?

data_jeonnam <- subset(data, upper=="전남") # Base R
data_jeonnam <- data %>% 
  filter(upper=="전남")

# 각종 지표의 상위 10개 지자체를 조사해보자
# 설비용량
data %>% 
  select(upper, lower, type, capa) %>% 
  arrange(desc(capa)) %>% 
  head(n=10)
  
# 태양광 총 갯수
data %>% 
  select(upper, lower, type, total_no) %>% 
  arrange(desc(total_no)) %>% 
  head(n=10)

## 전남 vs 서울 비교
# 평균 면적 당 태양광 갯수 (광역지자체 수준 비교)
data %>% 
  select(upper,lower,type,capa,total_no) %>% 
  filter(upper=="전남" | upper=="서울") %>%
  group_by(upper) %>% 
  summarize(uppercapa = sum(capa), uppertotal = sum(total_no)) %>%
  mutate(uppercapa_per_no = uppercapa/uppertotal)
              
  