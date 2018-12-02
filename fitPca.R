
fitLda=function(training){
  ctrl <- trainControl(method = "repeatedcv",
                       repeats = 5, number = 10,
                       verbose = TRUE,
                       classProbs = TRUE)

  results <- train(group ~ .,
                           data = training,
                           method = "lda",
                           trControl = ctrl,
                           metric = "Accuracy", # not needed it is so by default
                           importance=TRUE)  
}
