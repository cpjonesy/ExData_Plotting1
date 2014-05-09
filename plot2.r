## read in the data
require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "./household_power_consumption.txt"
hpc <- read.csv.sql(myFile, sql=mySql, sep=";")

## convert the date and time for correct formatting
hpc$Weekday <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')

## open the png device and set its parameters
png(file = "plot 2.png", width = 480, height = 480)

## make the plot
plot(hpc$Weekday, hpc$Global_active_power, 
        type = "l",
        ylab = "Global Active Power (kilowatts)",
        xlab = ""
        )

## turn off the png device
dev.off()
