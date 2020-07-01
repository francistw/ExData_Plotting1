# read table from file
hpc <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", nrows = 69516)
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
# plot with png
png("plot1.png")
with(hpc, hist(Global_active_power, 
               main = "Global Active Power", 
               xlab = "Global Active Power (kilowatts)", 
               col = "red"))
dev.off()