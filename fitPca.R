
fit=function(training, meth="lda"){
  ctrl <- trainControl(method = "repeatedcv",
                       repeats = 20, number = 5,
                       verbose = TRUE,
                       classProbs = TRUE,
                       )
  results <- train(group ~ .,
                           data = training,
                           method = meth,
                           trControl = ctrl,
                           importance=TRUE)  
}


validate=function(){
  predicted=predict(lda,newdata = testdata)
  tested=testdata$group
  table(predicted,tested)
}