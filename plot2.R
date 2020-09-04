#Include function to load the file in memory
source("load_file.R")
source("init_png.R")

#Load the lubridate library
library(lubridate)

#setlocale because my mother language is spanish, so is shown as in the request, show it in english
Sys.setlocale("LC_TIME", "English")

#Creates a var with the file source
data_file = "./data/household_power_consumption.txt"
png_file = "plot2.png"

#Call the load file function
data <- load_file(data_file)

#Call the init_png function to init the png device according to file parameter.
init_png(png_file, 480, 480)

#Generates the plot
plot(ymd_hms(paste(data$Date, data$Time)), data$Global_active_power, type="o", pch="", ylab="Global Active Power (kilowatts)", xlab="")

#Shuts off the device
dev.off()