
saveFile = TRUE #save file if you want

if (saveFile == TRUE){png(file = "plot2.png")}
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

#plot the 2nd plot
#plot(df$DateTime, df$Global_active_power, "l", ylab = "Global Active Power (kilowatts)", xlab="")

with (df, plot(DateTime, Global_active_power, "l", ylab = "Glob]al Active Power (kilowatts)", xlab=""))

if(saveFile==TRUE){dev.off()}

#dev.off()

