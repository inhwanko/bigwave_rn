
---
title: "Session 0"
author: "Inhwan Ko"
date: 'Oct 09, 2020'
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(results = "hide", warning = FALSE, message = FALSE,
                      fig.show = "hide")
```

# 1. 알에 대하여- RRRRRRRRRRRRRRRRRRRR

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


# 2. R과 RStudio?

R에 대한 소개는 어느정도 했으니, 이제 RStudio는 또 뭔지 간단하게 소개하기로 합니다. 별거 없습니다. R을 더 간편하게 사용할 수 있게 만든 프로그램입니다. 예컨대 R 언어를 인간의 언어로 좀 알아듣기 쉽게 바꿔주는 번역기 정도랄까요.  

R Studio의 기능에 대해서 간단히 알아보는 시간 갖겠습니다.  

**alt+shift+k**  

**ctrl+shift+H**  

**ctrl+enter**  

# 3. 계산기 R

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


# 4. 변수(variables)와 배정(assignment)

```{r}
four <- 2 + 2
four

```

```{r}
four + 3
four / 2 * 8 + four

```


# 5. 벡터와 행렬 (읭 여기 수학시간 아닌데)

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


# 6. class의 개념


```{r}
class(2)
class(four)
class("four")
class(newvec)
class(cmat)

class(sqrt)
class(cbind)

```


# 7-1. 겁나 중요한 class 1- data.frame

## 잠깐, 그 전에 패키지는 뭐야?  


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

# 7-2. 겁나 중요한 class 2- list

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

# 7-3. 겁나 중요한 class 3- logical

```{r}
class(NA)

example <- c(NA, NA, 1, 2, 4)
is.na(example)

!is.na(example)

sum(is.na(example))
sum(!is.na(example))
```


# 8. Dataset 다운로드 하기

R 환경에서 데이터를 다운로드 하는 방법은 두 가지가 있습니다. 

- 


# 9. RMarkdown 튜토리얼

RMarkdown은 쉽게 말해 R로 쓰는 Microsoft Word라고 생각하면 됩니다. 물론 Word처럼 문서 생성/편집만 할 수 있는게 아니라 PPT, HTML 페이지 등 여러가지 형태의 결과물을 만들 수 있습니다. 지금 보시고 있는 이 HTML 문서도 RMarkdown으로 만들었는데요, 지금부터는 RMarkdown을 어떻게 사용하는지 직접 실습해보기로 합니다.  
https://gist.github.com/ihoneymon/652be052a0727ad59601 


