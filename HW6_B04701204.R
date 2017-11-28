#install.packages("e1071")
library(e1071)

source( 'read.libsvm.R' )
wine = read.libsvm( 'wine.scale', 13 )
wine = as.data.frame(wine)
names(wine) = c("type","alc","acid","ash","alk","mag","phenols","flav","nonflav","proanth","color","hue","OD","proline")

plot(wine)

#plot(wine$acid, wine$OD, col=wine$type)
#plot(wine$acid, wine$phenols, col=wine$type)
#plot(wine$OD, wine$phenols, col=wine$type)
#plot(wine$color, wine$hue, col=wine$type)
#plot(wine$alc, wine$color, col=wine$type)

plot(wine$flav, wine$hue, col=wine$type)
#plot(wine$alc, wine$hue, col=wine$type) 
#plot(wine$alc, wine$flav, col=wine$type) 

plot(wine$flav, wine$color, col=wine$type) ##

s = sample(150,100)
col = c("flav","hue","type")
wine_train = wine[s,col]
wine_test = wine[-s,col]

#tuned = tune(svm,type ~ ., data = wine_train, 
#             kernel = "linear", 
#             ranges=list(cost = c(0.001,0.01,0.1,1,10,100)))
#summary(tuned)

svmfit = svm(type ~ ., data = wine_train, 
             kernel = "linear", 
             cost=0.1, scale=FALSE)

print(svmfit)
plot(svmfit, wine_train)
### 不知道為什麼plot不出來?!!
