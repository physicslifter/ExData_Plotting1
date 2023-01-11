saveFile = TRUE #save file if you want

if (saveFile == TRUE){png(file = "plot4.png")}
start_date <- as.Date(strptime("02/01/2007", "%m/%d/%Y"))
end_date <- as.Date(strptime("02/02/2007", "%m/%d/%Y"))
df <- read.table("Data/household_power_consumption.txt", sep=";", header=T)
df <- subset(df, as.Date(strptime(Date, "%d/%m/%Y")) <= end_date)
df <- subset(df, as.Date(strptime(Date, "%d/%m/%Y")) >= start_date)
df <- subset(df, Global_active_power != "?")
df <- subset(df, Date != "?")
df <- subset(df, Time != "?")
df <- transform(df, 
                Global_active_power = as.numeric(Global_active_power)
)
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
with (df, plot(DateTime, Global_active_power, "l", ylab = "Glob]al Active Power (kilowatts)", xlab=""))
with(df, plot(DateTime, Voltage, "l", xlab="datetime"))
with(df, plot(DateTime, Sub_metering_1, "l", col="black", xlab = "", ylab = "Energy sub metering"))
with(df, lines(DateTime, Sub_metering_2, "l", col = "red"))
with(df, lines(DateTime, Sub_metering_3, "l", col = "blue"))
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), fill = c("black", "blue", "red"))
with(df, plot(DateTime, Global_reactive_power, "l"), xlab = "datetime")
if(saveFile==TRUE){dev.off()}
