#Part2 데이터 전처리
#2장

transform(iris, Sum.Length=Sepal.Length+Petal.Length)

#변수축소-1
#주성분분석, PCA

library(dataset)
data("USArrests")

#데이터 확인
head(USArrests)

#산점도를 통해 변수 간 상관관계 파악
pairs(USArrests, panel=panel.smooth, main="USArrests data")

#주성분분석 수행
#princomp()는 공분산행렬의 고유벡터를 구하는 방법을 사용
US.prin <- princomp(USArrests, cor=TRUE)
summary(US.prin)

# Importance of components:
#                                       Comp.1    Comp.2    Comp.3     Comp.4
# 주성분의 표준편차 Standard deviation  1.5748783 0.9948694 0.5971291 0.41644938
# 주성분의 기여율Proportion of Variance 0.6200604 0.2474413 0.0891408 0.04335752
# 누적기여율 Cumulative Proportion      0.6200604 0.8675017 0.9566425 1.00000000

#screeplot그리기
plot(US.prin, type='l')
#3번째 주성분에서 기울기가 급격하게 줄어드는 형태를 보이므로, 그 이전 주성분인 2번째 주성분까지 선택하는 것이 적절하다.

#주성분계수 확인
US.prin$loadings

#주성분점수
US.prin$scores

#제1-2주성분에 의한 행렬도
biplot(US.prin, scale=0)

#변수축소-2
#요인분석#p65
#데이터 확인
data(swiss)
str(swiss)
#정규화 수행 및 실습 데이터 생성
Min <- apply(swiss, 2, min)
Max <- apply(swiss, 2, max)
swiss.fa <- scale(swiss, center=Min, scale=(Max-Min))
head(swiss.fa)
#요인분석 factor=3으로 줌 rotation인자는 기본값 varimax
factanal(swiss.fa, factors = 3)
#Proportion Var : 각 요인이 설명하는 분산의 비율
#Cumulative Var : 요인들의 전체 데이터 분산에 대한 설명력


#3절 표준화와 정규화
#scale()#표준정규화 : z-score표준화 
#예제
head(mtcars)
#test.cars <- data.frame(mtcars$mpg,mtcars$hp)
#위처럼 하면 행이름이 없어짐
test.cars <- mtcars[,c("mpg","hp")]
head(test.cars)

test.cars <- transform(test.cars,
                       mpg.scale=scale(test.cars$mpg),
                       hp.scale=scale(test.cars$hp))
head(test.cars)

#정규화 일반적으로 min-max
Min <- min(iris$Sepal.Length)
Max <- max(iris$Sepal.Length)
iris$SL.new <- scale(iris$Sepal.Length, center = Min, scale = Max-Min)
head(iris)
