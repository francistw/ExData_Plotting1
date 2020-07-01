# set locale for proper time format and save the default value to "locale"
locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
# read table from file
hpc <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", nrows = 69516)
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
# combine date & time and convert them to proper format
Date_and_Time <- paste(hpc$Date, hpc$Time)
Date_and_Time <- strptime(Date_and_Time, "%d/%m/%Y %H:%M:%S")
# plot with png
png("plot4.png")
par(mfcol = c(2,2))
plot(Date_and_Time, hpc$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(Date_and_Time, hpc$Sub_metering_1,
     type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(Date_and_Time, hpc$Sub_metering_2, col = "red")
lines(Date_and_Time, hpc$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Date_and_Time, hpc$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(Date_and_Time, hpc$Global_reactive_power,
     type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
# restore to default locale
Sys.setlocale("LC_TIME", locale)