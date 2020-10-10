# 1. 알에 대하여- RRRRRRRRRRRRRRRRRRR

R은 "객체지향" 프로그래밍 툴입니다. 여기서 객체(object)란 쉽게 말해 우리가 R에서 사용하는 명령어나 데이터셋과 같은 요소들을 말합니다. R이 객체를 지향한다는 말은 R에서 사용되는 대부분의 기능들이 바로 이 R에서 사용되는 객체들을 "공통적으로" 사용하여, 새로운 기능이 나오더라도 우리가 유연하게 사용할 수 있게끔 배려한다는 말입니다.  

예컨대 우리가 두 개의 OLS 분석을 한다고 생각해봅시다. 하나는 단시간 횡단면 자료이기 때문에 원래 R에 부착된 패키지인 **base**의 명령어 ```lm()```을 사용할 수 있겠지만, 다른 하나는 패널 자료이기 때문에 **plm**이라는 패키지의 명령어 ```plm()```을 사용해야 합니다.  

이 경우 두 명령어를 사용한 결과값을 각각 "result1"과 "result2"라는 객체로 저장했다고 합시다. 여기서 두 가지 재밌는 사실이 있습니다. 첫째, 결과값은 많은 새끼 객체들을 포함하고 있습니다. 예컨대 "coefficients"나 "residuals"와 같은 새끼 객체들은 분명 다른 패키지의 명령어를 사용한 두 결과값임에도 불구하고 둘 다에 들어있습니다. 둘째, 이 결과값들에 우리는 *대체로* 같은 명령어를 사용할 수 있습니다. 예컨대 ```print()``` 안에 두 객체를 넣으면 비슷한 형태로 결과값이 나타납니다. ```summary()```라는 명령어 안에 넣어도 마찬가지구요. 그 이유는 ```print()```와 ```summary()``` 둘 다 같은 객체를 불러오게끔 만들어진 명령어이기 때문입니다.  

이렇게 다른 패키지 안의 객체나 명령어(사실 명렁어도 객체의 일종임)가 서로 호환 가능하다는 점은 크게 놀랍지 않게 다가올 수도 있겠습니다. 사용하는 사람 입장에서는 우리가 원하는 분석을 하게끔 해주는 패키지가 있다고 한다면, 그걸 다운받아서 목적에 맞게 사용하기만 하면 그만이니까요. 그러나 그렇게 다운받은 새로운 패키지가 우리가 기존에 자주 사용하던 패키지들과 전혀 다른 문법을 지녔다면 어떨까요? 예컨대 패널로짓 분석을 하게끔 해주는 **plogit**이라는 패키지의 ```plogit()```이라는 명령어가 있다고 가정해봅시다. 다음과 같이 ```plogit()```을 사용해서 결과값을 저장했다고 합시다.  

```{r, eval=F}
result3 <- plogit(data, ....)

```

결과값의 총 잔차를 불러오기 위해 ```result3$residuals``` 라고 콘솔창에 입력했다고 합시다. 그런데 에러 메시지가 뜹니다. 당황한 저는 ```plogit()``` 패키지의 설명서를 다 뒤져서 해당 객체가 "residuals"가 아닌 "residual"이었다는 것을 알아냅니다. 즉, ```result3$residual```이라고 입력했어야 하는 것이죠. 뿐만 아니라 해당 패키지는 모든 객체가 우리가 알고 있는 다른 객체들과 다르도록 만들어졌다는 것을 알아냅니다. 저는 열받은 나머지 R을 꺼버리고 플레이스테이션4를 하러 갑니다.  

R 프로그래밍을 사용하게 되면 이런 일이 (아주 약간의 예외를 제외하고) 발생하지 않습니다. 우리가 통상적으로 통계와 관련해서 사용해야 하는 개념들, 예컨대 coefficient, residuals, variance-covariance matrix 등이 공통의 객체로 R에서는 표현되고 있으며 이를 새로운 패키지들은 존중합니다. 따라서 하나의 "언어"라고 할 수 있는 것이죠. 영어에서는 사람에 따라 사과를 지칭하는 말이 다르지 않습니다. 단, 영어와 한국어는 다르죠. 이 차이는 R과 다른 프로그래밍 언어, 예컨대 Python 간의 차이와 비슷하다고 볼 수 있습니다.

위의 문단을 한 문장으로 표현하자면 "R 프로그래밍을 사용하게 되면 R이 객체 지향 프로그램이기 때문에 이런 일이 (아주 약간의 예외를 제외하고) 발생하지 않습니다" 가 되겠습니다. 얼핏 보면 우리를 배려해주는 프로그램인 것 같지만 우리가 객체를 사용하기 때문에 객체 지향 프로그램이 우리에게 편리하다고 할 수 있겠군요!

**Disclaimer**: 물론 R이 잘못한게 아니라 제가 잘못해서 R를 꺼버리고 플레이스테이션4를 하러 가는 일이 더 많긴 합니다. R만세.


## 1.1. R과 RStudio?

R에 대한 소개는 어느정도 했으니, 이제 RStudio는 또 뭔지 간단하게 소개하기로 합니다. 별거 없습니다. R을 더 간편하게 사용할 수 있게 만든 프로그램입니다. 예컨대 R 언어를 인간의 언어로 좀 알아듣기 쉽게 바꿔주는 번역기 정도랄까요. 세션에서 여러가지 R Studio의 기능들을 소개시켜 드리겠습니다.

R의 기능에 대해서 간단히 알아보는 시간 갖겠습니다.  

# 2. R 기반 기본 

# 2.1. 계산기 R

```{r}
2 + 3
2 - 3
2 * 3
2 / 3

```

```{r}
4^2

```

```{r}
sqrt(4)

```

```{r}
(2 * 4 + 3 ) / 10
sqrt(2 * 2)
```


# 2.2. 변수(variables)와 배정(assignment)

```{r}
four <- 2 + 2
four

```

```{r}
four + 3
four / 2 * 8 + four

```


# 2.3. 벡터와 행렬 (읭 여기 수학시간 아닌데)

```{r}
newvec <- c(175, 188, 164, 195)
newvec
```

```{r}
length(newvec)
```

```{r}
newmat <- c(c(1,7,2,3),
            c(4,6,2,1),
            c(6,3,2,6))
newmat

```

```{r}
rmat <- rbind(c(1,7,2,3),
            c(4,6,2,1),
            c(6,3,2,6))
rmat

```

```{r}
cmat <- cbind(c(1,7,2,3),
            c(4,6,2,1),
            c(6,3,2,6))
cmat

```

```{r}
cmat[1,]
cmat[,1]
cmat[1,2]
```


# 2.4. 통계 사용하기

```{r}
bernoulli <- sample(x=c(1,0), size=10, prob=c(0.7, 0.3), replace=T)

binom <- vector(mode="numeric", length=10,000)

for (i in 1:10,000) {
 binom[i] <- sum(sample(x=c(1,0), size=10, prob=c(0.7, 0.3), replace=T))
}

rbinom(n=10,000, size=10, prob=.7)

mean(bernoulli)
sd(bernoulli)

```


# 3. class의 개념

class란 R 환경에서 사용하는 다양한 오브젝트들의 "성격"을 말합니다. 

```{r}
class(2)
class(four)
class("four")
class(newvec)
class(cmat)

class(sqrt)
class(cbind)

```


## 3.1. 겁나 중요한 class 1- data.frame

### 잠깐, 그 전에 패키지는 뭐야?  


```{r}
# install.packages("gapminder")
library(gapminder)
data(gapminder)

```

```{r}
gapminder
class(gapminder)
```

```{r}
dim(gapminder)
names(gapminder)
head(gapminder)
summary(gapminder)
```

```{r, eval=F}
gapminder$lifeExp
```

```{r}
unique(gapminder$continent)
```

## 3.2. 겁나 중요한 class 2- list

```{r}
list <- list(NULL)
class(list)

list[[1]] <- cmat
list[[2]] <- rmat

list
```

```{r}
list[[3]] <- newvec

list
```

## 3.3. 겁나 중요한 class 3- logical

```{r}
class(NA)

example <- c(NA, NA, 1, 2, 4)
is.na(example)

!is.na(example)

sum(is.na(example))
sum(!is.na(example))
```


# 4. Dataset 다운로드 하기

R 환경에서 데이터를 다운로드 하는 방법은 두 가지가 있습니다. 

- "Gapminder" 처럼 미리 준비된 패키지에서 다운로드
- 내가 준비한 자료를 R 환경에 부착 (.dat, .pdf, .txt, .xlsx, .csv 등)

하드웨어에 저장된 자료를 R 환경에 부착하려면 현재 실행하고 있는 코드 파일과 해당 자료가 한 폴더 안에 있어야 하고, R 환경이 돌아가고 있는 작업 환경 (working directory)를 해당 폴더로 바꿔주어야 합니다. 작업 환경을 확인/변경하려면 다음의 코드를 실행하거나 명령어를 사용하세요.

```{r}
get.wd()
set.wd("폴더 디렉토리") # 혹은 ctrl+shift+H

```

Week 0 디렉토리 안에 있는 csv 파일과 xlsx 파일을 다운받아서 R 환경에 업로드해봅시다.

```{r}
fdi <- read.csv("fdi.csv")

#library(readxl)
audit <- read_excel("audit.xlsx", sheet = 2)
```

오류가 난다구요? 그 이유는 read_excel() 명령어는 별도의 패키지를 요구하기 떄문입니다. 위의 코드에서 ```#```을 지우고 패키지를 실행시킨 다음, 다시 한 번 돌려보세요.

# 4.1. 데이터셋 쪼물딱(wrangle)하기- tidyverse의 등장

개인적으로 데이터셋을 가지고 작업하는 것은 R에 기본적으로 깔려 있는 패키지 문법인 R Base보다도 또다른 문법 (혹은 사투리) 인 tidyverse가 더 강력하다고 생각합니다. 

[Base와 Tidyverse의 차이](https://tavareshugo.github.io/data_carpentry_extras/base-r_tidyverse_equivalents/base-r_tidyverse_equivalents.html)

위에서 다운받은 ```fdi``` 데이터셋으로 여러 가지 데이터 변환 예제를 통해 그 차이를 느껴봅시다.

```{r}
# 그 전에 변수명좀 간단하게 합시다

fdi <- fdi[c(1,3,7,8),]
colnames(fdi) <- c("year","economy","direction","USD")

head(fdi)
attach(fdi)

unique(year)
unique(economy)

# 한국 (Korea, Republic of)의 1970-1987년 데이터만 보고 싶다면?

## base
korea7087 <- fdi[year==1970:1987 & economy=="Korea, Republic of", ] # 혹은
korea7087 <- subset(fdi, year==1970:1987 & economy=="Korea, Republic of")

## tidyverse
korea7087 <- fdi %>%
 filter(year==1970:1987 & economy=="Korea, Republic of")
```

잘 보시면 tidyverse는 ```%>%``` 라는 특이한 기호를 사용하는 걸 볼 수 있습니다. 이는 pipe operator라고 부르는 것인데요, 우리나라 어순에 맞게 "A를, B 처리 한 다음, C 처리한다" 이런 식으로 나열할 때 쓰이는 접속사 같은 것입니다. base는 대신 C처리(B(처리A를)) 이런 식으로 마지막 실행과정을 제일 처음에 놓게 되죠. 간단한 예를 들어볼까요?

```{r}
# 한국의 1970-1987년 사이 FDI 평균 유입량을 현재 가치 기준 달러액으로 보여주세요!

## base R

mean(fdi[year==1970:1987 & economy=="Korea, Republic of" & direction=="Inward",])

# tidyverse
`
fdi %>%
 filter(Year==1970:1987 & Economy=="Korea, Republic of") %>%
 filter(Direction=="Inward")
 mean(US dollars at current prices in millions)

```

보시면 각각의 장단점이 있습니다. base R은 코드가 비교적 짧은 반면, 작업 과정(workflow)을 직관적으로 이해하기는 어렵죠. 그러나 tidverse는 작업 과정이 직관적으로 그리고 자연스럽게 이어지도록 써내려가지는 반면 라인이 길어지게 됩니다. 각자의 장단점이 있으니 실제 코딩 경험을 쌓아나가시면서 적절하게 혼용하시면 되겠습니다! 저는 솔직히 두 개를 똑 구분해서 사용하지는 않습니다. 



# 5. RMarkdown 튜토리얼

RMarkdown은 쉽게 말해 R로 쓰는 Microsoft Word라고 생각하면 됩니다. 물론 Word처럼 문서 생성/편집만 할 수 있는게 아니라 PPT, HTML 페이지 등 여러가지 형태의 결과물을 만들 수 있습니다. 지금 보시고 있는 이 HTML 문서도 RMarkdown으로 만들었는데요, 지금부터는 RMarkdown을 어떻게 사용하는지 직접 실습해보기로 합니다.  
https://gist.github.com/ihoneymon/652be052a0727ad59601 



