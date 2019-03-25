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

animate=function(){
  tseq=seq(1,20)/20
  for(t in tseq){
    ch=0.20-0.20*t
    acidity=0.36+0.44*t
    ph=3.28+0.54*t
    al=12.7+1.5*t
    ct=as.character(t*20)
    if(t*20 < 10){
      ct=paste(0,ct,sep="")
    }
    nome=paste(paste('output',ct,sep=''),'.png',sep='')
    print(nome)
    png(nome,width=720,height=720)
    z=change(newdata=m[quality==9][4],ch,acidity,ph,al)
    print(z$g)
    dev.off()    
  }
}

validate_regreesion=function(p){
  p$index=seq(1:nrow(p))
  mp=melt(p,id.vars = "index")
  reg=mp[,.(y=sum(as.integer(variable)*value)),index]
  reg$yt=as.integer(testdata$group)
  reg$prob=reg
  reg[,sum(abs(y-yt))/.N]
}