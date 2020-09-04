#Include function to load the file in memory
source("load_file.R")
source("init_png.R")

#Load the lubridate library
library(lubridate)

#setlocale because my mother language is spanish, so is shown as in the request, show it in english
Sys.setlocale("LC_TIME", "English")

#Creates a var with the file source
data_file = "./data/household_power_consumption.txt"
png_file = "plot3.png"

#Call the load file function
data <- load_file(data_file)

#Call the init_png function to init the png device according to file parameter.
init_png(png_file, 480, 480)

#Generates the plot
plot(ymd_hms(paste(data$Date, data$Time)), data$Sub_metering_1, col="black", type="o", pch="", ylab="Energy sub metering", xlab="")
lines(ymd_hms(paste(data$Date, data$Time)), data$Sub_metering_2, col="red")
lines(ymd_hms(paste(data$Date, data$Time)), data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1:1)

#Shuts off the device
dev.off()