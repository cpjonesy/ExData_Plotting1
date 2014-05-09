## read in the data
require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "./household_power_consumption.txt"
hpc <- read.csv.sql(myFile, sql=mySql, sep=";")

## open the png device and set its parameters
png(file = "plot 1.png", width = 480, height = 480)

## make the plot
hist(hpc$Global_active_power,
        col = "red", 
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)")

## turn off the png device
dev.off()