#Code to read the data file
#In order the filter the data while reading it is necessary to install the package
#"sqldf" (install.packages("sqldf"))

load_file <- function(file) {
  
  #Loads the sqldf library
  library(sqldf)
  library(dplyr)

  #Loads the data to the data data_frame using the read.csv.sql command, so we can directly select
  #the data before loading into the DF
  data <- read.csv.sql(file, sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")

  #Changes the date column to match a date type
  data <- mutate(data, Date = strptime(Date, "%d/%m/%Y"))

  data

}