rankall <- function(outcome, num ="best") 
{     
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
      
      data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
      
      uniqueState <- unique(data[,7], incomparables = FALSE)
      uniqueState <- uniqueState[order(uniqueState)]
      
      for (i in 1:length(uniqueState)) 
      {           
            gooddata <- data[data$State == uniqueState[i], ] 
            gooddata <- gooddata[complete.cases(gooddata[,colnum]),]
            gooddata[,colnum] <- as.numeric(gooddata[,colnum])
            if (num == "best")
            {
                  rowvalue <- 1
            }
            else if (num == "worst")
            {
                  baddata <- is.na(gooddata[,colnum])
                  rowvalue <- NROW(gooddata[,colnum][!baddata])
            }
            else
            {
                  rowvalue <- num
            }
            gooddata <- gooddata[order(gooddata[,colnum],gooddata[,2]),]
            
            minvaluedata <- data.frame(cbind(hospital=gooddata[rowvalue,2],state = uniqueState[i]))
            
            if (i == 1) {
                  assign("rankallvalue", minvaluedata) }
            else
            {
                  rankallvalue <- rbind(rankallvalue, minvaluedata)              
            }
      }
      return(rankallvalue)
}