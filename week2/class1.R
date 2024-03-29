
library(ggplot2)
head(iris)

#單變數:類別型   

ggplot(data=iris,aes(x=Species))+
  geom_bar(fill ="lightblue",colour="white")
 

#單變數:連續型

ggplot(data=iris,aes(x=Sepal.Length))+
  geom_histogram()


#雙變數:連續vs連續   

ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,color=Species))+
  geom_point()
 

#雙變數:離散vs連續   

ggplot(iris,aes(x=Species,y=Petal.Width))+
  geom_boxplot()


#多變量:iris樣本總體的關係

library(dplyr)
iris1=iris %>%
  mutate(Petalarea=Petal.Length*Petal.Width,Sepalarea=Sepal.Length*Sepal.Width)
ggplot(iris1,aes(x=Sepal.Length,y=Sepal.Width,color=Species,size=Petalarea))+
  geom_point()
ggplot(iris1,aes(x=Petal.Length,y=Petal.Width,color=Species,size=Sepalarea))+
  geom_point()
#ggmap
if(!require(ggmap))install.packages("ggmap",repos = "http://cran.us.r-project.org")
library(ggmap)
if(!require(mapproj))install.packages("mapproj",repos = "http://cran.us.r-project.org")
if(!require(readr))install.packages("readr",repos = "http://cran.us.r-project.org")
library(mapproj)
library(readr)
real<-read_csv('C:/Users/user/Desktop/codingsite/ntu-cs-x/week2/777.csv')
map <- get_map(location =  c(lon = 120.2, lat = 23.7057668), zoom = 8,
               language = "zh-TW")
ggmap(map)+geom_point(aes(x=xwgs,y=ywgs,color='red'),data=real)+
  ggtitle("台灣五十筆地址")