### Exploratory Data Analysis Project 1

#plot3.R
hpc <- read.table("household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?")
subhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

subhpc$datetime <- strptime(paste(subhpc$Date, subhpc$Time), 
                            format = "%d/%m/%Y %H:%M:%S")
    ## data...time...   

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
with(subhpc, plot(subhpc$datetime, subhpc$Sub_metering_1, type = "l", 
                  xlab = "", ylab = "Energy sub metering"))
lines(subhpc$datetime, subhpc$Sub_metering_2, col = "red")
lines(subhpc$datetime, subhpc$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
