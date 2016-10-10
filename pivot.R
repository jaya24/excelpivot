#reading data from pivot table in multiple sheets of excel and collating it as master data
pivot<-function(worksheet_link, sheet_list,start_row)
{require(rJava)
  require(openxlsx)
  require(dplyr)
  require(tidyr)
  require(zoo)
  
  x<-length(sheet_list)
  #reading 1st sheet of excel
  master_data_PNL<-read.xlsx(worksheet_link, sheet =sheet_list[1] ,startRow=start_row ,colNames=TRUE,rowNames=FALSE)
  
  if(x>1)
  {
    #looping through sheet and appending values to master data 
    
    for(i in 2:x)
    {
      a<-read.xlsx(worksheet_link, sheet =sheet_list[i] ,startRow=start_row ,colNames=TRUE,rowNames=FALSE,)
      master_data_PNL<-dplyr::union(master_data_PNL,a)
      
      rm(a)
      
    }
  }
}
