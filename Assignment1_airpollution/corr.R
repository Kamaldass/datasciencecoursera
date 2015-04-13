corr <- function(directory, threshold = 0) 
{
      # --- Assert create an empty numeric vector
      corvar <- numeric(0)
      
      # --- Assert get a data frame as ID = 1:332
      getfile <- complete("specdata")
      
      # --- Assert apply threshold
      thresfile <- getfile[getfile$nobs > threshold, ]
      
      for (cid in thresfile$id) 
      {
            data <- paste(getwd(),"/",directory,"/",sprintf('%03d',cid),".csv",sep="")            
            
            #Read the files
            data = read.csv(data, header=T)  
            compdata <- data[complete.cases(data),]
            corvar <- c(corvar, cor(compdata$sulfate, compdata$nitrate, use = "pairwise.complete.obs"))
      }
      # ---  return the numeric correlation vector 
      return(corvar)
}