#Exploratory Data Analysis
#Week 1 Course Project 1
# by James Sheldon
#12/May/2016

#Plot 3

#This file takes the already available data file in the working directory and produces the required histogram
#In this implementation we use the dplyr and lubridate functions to make data manipulation easier.
#There's a quick check at the beginning to see if these functions are installed and if they're not, downlad them.

#--------------------------------------------------------------------------------------------------------------------
#Create a function to test whether or not a package is installed.
is.installed <- function(mypkg) { 
    is.element(mypkg, installed.packages()[,1]) 
}

#Check whether or not the packages "lubridate" and "dplyr" are installed.  If not, download them.
if(is.installed("dplyr") == FALSE) {
    install.packages("dplyr")
}

#Load dplyr
library(dplyr)

if(is.installed("lubridate") == FALSE) {
    install.packages("lubridate")
}

#Load lubridate
library(lubridate)
#--------------------------------------------------------------------------------------------------------------------


#Read in the full text file.
power <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE, dec=".")

#Subset the file to include only variables we need for the plot
power <- select(power, -(Global_active_power:Global_intensity))

#Subset the file to include only the dates 2/1/2007 and 2/2/2007
power <- filter(power, Date %in% c("1/2/2007", "2/2/2007"))

#Create the timestamp and make sure each Sub_metering_* is numeric. Store each in their own vector.
timestamp <- strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
Sub1 <- as.numeric(power$Sub_metering_1)
Sub2 <- as.numeric(power$Sub_metering_2)
Sub3 <- as.numeric(power$Sub_metering_3)

#Open the PNG graphics device
png(filename = "./plot3.png", width = 480, height = 480)

#Produce the graphic
plot(timestamp, Sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(timestamp, Sub2, type = "l", col = "red")
lines(timestamp, Sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)

#Close the connection to the PNG Device to write the file to disk
dev.off()