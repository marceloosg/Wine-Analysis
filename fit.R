library(caret)
library(MASS)
myfit=function(training, meth="lda"){
  #Partition 70% of data for training stratified for target variable
  training[,index:=seq(1,.N)]
  train_ind=training[,.(selected=sample(index,0.7*.N)),group]$selected
  training=training[,-c("index")]
  traindata=training[train_ind]
  testdata=training[-train_ind]
  ifelse(meth=="lda",
  ctrl <- trainControl(method = "repeatedcv",
                       repeats = 20, number = 5,
                       verbose = F,
                       classProbs = TRUE
                   ),
  
  ctrl <- trainControl(method = "repeatedcv",
                       repeats = 20, number = 5,
                       verbose = F
  )
  )
  results.train <- train(group ~ .,
                           data = training,
                           method = meth,
                           trControl = ctrl)  
  
  results.test <- predict(results.train, newdata = testdata)
  list("train"=results.train,"test"=results.test,"traindata"=traindata,"testdata"=testdata)
}


validate_regreesion=function(p){
  p$index=seq(1:nrow(p))
  mp=melt(p,id.vars = "index")
  reg=mp[,.(y=sum(as.integer(variable)*value)),index]
  reg$yt=as.integer(testdata$group)
  reg$prob=reg
  reg[,sum(abs(y-yt))/.N]
}