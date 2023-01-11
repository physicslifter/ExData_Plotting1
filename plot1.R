saveFile = TRUE #save file if you want

if (saveFile == TRUE){png(file = "plot1.png")}

data <- read.table("Data/household_power_consumption.txt", sep=";", header=T)
start_date <- as.Date(strptime("02/01/2007", "%m/%d/%Y"))
end_date <- as.Date(strptime("02/02/2007", "%m/%d/%Y"))
df <- read.table("Data/household_power_consumption.txt", sep=";", header=T)
df <- subset(df, as.Date(strptime(Date, "%d/%m/%Y")) <= end_date)
df <- subset(df, as.Date(strptime(Date, "%d/%m/%Y")) >= start_date)
df <- subset(df, Global_active_power != "?")
df <- transform(gap, Global_active_power = as.numeric(Global_active_power))
with(gap, hist(Global_active_power, 
               main = "Global Active Power", 
               col = "red", 
               xlab = "Global Active Power (kilowatts)", 
               ylab = "Frequency",
               xlim = c(0, 6)))

if(saveFile==TRUE){dev.off()}
