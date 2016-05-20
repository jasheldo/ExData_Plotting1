library(lubridate)
#Read in the full text file.
power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Subset the file to include only the dates 2/1/2007 and 2/2/2007
power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#Change the class of Date from "factor" to "Date" using Lubridate
#x <- dmy(power$Date)
#power$Date <- x
#as.Date(power$Date)

#Change Time from numeric to time
#strptime(power$Time, format = "%H:%M:%S")
power$Global_active_power <- as.numeric(power$Global_active_power)

hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")