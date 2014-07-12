### Exploratory Data Analysis Project 1

# plot1.R
hpc <- read.table("household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?")
subhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(subhpc$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", ylim = c(0,1200), col = "red")
dev.off()
