### Exploratory Data Analysis Project 1

#plot4.R
hpc <- read.table("household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?")
subhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

subhpc$datetime <- strptime(paste(subhpc$Date, subhpc$Time), 
                            format = "%d/%m/%Y %H:%M:%S")
    ## data...time...   

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2,2))
plot(subhpc$datetime, subhpc$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")
plot(subhpc$datetime, subhpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(subhpc$datetime, subhpc$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(subhpc$datetime, subhpc$Sub_metering_2, col = "red")
lines(subhpc$datetime, subhpc$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 1,col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(subhpc$datetime, subhpc$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
