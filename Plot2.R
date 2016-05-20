#Exploratory Data Analysis
#Week 1 Course Project 1
# by James Sheldon
#12/May/2016

#Plot 2

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

#Subset the file to include only the dates 2/1/2007 and 2/2/2007
power <- filter(power, Date %in% c("1/2/2007", "2/2/2007"))

#Create the timestamp and make sure each Sub_metering_* is numeric. Store each in their own vector.
timestamp <- strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(power$Global_active_power)

#Open the PNG graphics device
png(filename = "./plot2.png", width = 480, height = 480)

#Produce the graphic
plot(timestamp, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Close the connection to the PNG Device to write the file to disk
dev.off()