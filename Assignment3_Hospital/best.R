best <- function(state, outcome) 
{     data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
      if (!state %in% data$State) 
      {
            stop("invalid state")
      }
      gooddata <- data[data$State == state, ] 
      
      if (outcome == "heart attack")
      {
            colnum <- 11     
      }
      else if (outcome == "heart failure")
      {
            colnum <- 17
      }     
      else if (outcome == "pneumonia")
      {
            colnum <- 23
            
      }
      else
      {
            stop("Invalid Outcome")
      }
      gooddata <- gooddata[complete.cases(gooddata[,colnum]),]
      gooddata[,colnum] <- as.numeric(gooddata[,colnum])
      gooddata <- gooddata[order(gooddata[,colnum],gooddata[,2]),]
      minvaluedata <- gooddata[1,2]
      return(minvaluedata)
}