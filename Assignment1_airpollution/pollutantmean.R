pollutantmean <- function(directory=getwd(), pollutant, id=1:332) 
{     merge_data <- NULL
      for (i in 1:length(id))
      {     #Extract the file names based on file numbers
            filenames <- paste(getwd(),"/",directory,"/",sprintf('%03d',id[i]),".csv",sep="")            
            #Read the files
            data = read.csv(filenames, header=T)              
            # Merge files
            if (i == min(id)) {
                  assign("merge_data", data) }
            else
            {
                  merge_data <- rbind(merge_data, data)              
            }
      }
      # calculate Mean.
      mean(merge_data[, pollutant], na.rm = TRUE)
}