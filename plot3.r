## read in the data
require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "./household_power_consumption.txt"
hpc <- read.csv.sql(myFile, sql=mySql, sep=";")

## convert the date and time for correct formatting
hpc$Weekday <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')

## open the png device and set its parameters
png(file = "plot 3.png", width = 480, height = 480)

## make the plot
plot(hpc$Weekday, hpc$Sub_metering_1,
        type = "l",
        xlab = "",
        ylab = "Energy sub metering")
lines(hpc$Weekday, as.numeric(as.character(hpc$Sub_metering_2)),
        type = "l", 
        col = "red")
lines(hpc$Weekday, as.numeric(as.character(hpc$Sub_metering_3)),
        type = "l", 
        col = "blue")
legend("topright", 
        lty = 1,
        col=c("black", "blue", "red"), 
        legend = c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"))

## turn off the png device
dev.off()





