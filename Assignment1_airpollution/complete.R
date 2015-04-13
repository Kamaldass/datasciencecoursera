complete <- function(directory, id = 1:332) 
{
      for (i in 1:length(id))
      {
            data<-NULL
            #Extract the file names based on file numbers
            data <- paste(getwd(),"/",directory,"/",sprintf('%03d',id[i]),".csv",sep="")            
            #Read the files
            data = read.csv(data, header=T)  
            gooddata <- data[complete.cases(data),]
            completedata <- data.frame(cbind(id=id[i],nobs=nrow(gooddata)))
            if (i == 1) {
                  assign("finaldata", completedata) }
            else
            {
                  finaldata <- rbind(finaldata, completedata)
            }
      }
      return(finaldata)
}
