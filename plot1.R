
#Read in the full text file.
power <- read.csv("./data/household_power_consumption.txt", sep = ";")

#Subset the file to include only the dates 2/1/2007 and 2/2/2007
power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#Change the class of Date from "factor" to "Date"
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")