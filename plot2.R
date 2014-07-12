### Exploratory Data Analysis Project 1

# plot2.R
hpc <- read.table("household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?")
subhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

subhpc$datetime <- strptime(paste(subhpc$Date, subhpc$Time), 
                            format = "%d/%m/%Y %H:%M:%S")
    ## data...time...   

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(subhpc$datetime, subhpc$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
