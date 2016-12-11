url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url,temp,method = "auto")
con <- unzip(temp)
data <- read.csv(con,sep = ";" , na.strings = c("?"))
unlink(temp)

if(!require("dplyr")){install.packages("dplyr");library(dplyr)}
if(!require("lubridate")){install.packages("lubridate");library(lubridate)}

subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
time <- strptime(paste(subset$Date,subset$Time),"%d/%m/%Y %H:%M:%S")

png("plot4.png",480,480)
par(mfrow = c(2,2), mar = c(4,4,2,2))

plot(time,subset$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "")  ##to plot 1st graph

plot(time,subset$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")  ##to plot 2nd graph

plot(time,subset$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")   ##to plot 3rd graph
points(time,subset$Sub_metering_2,type = "l",col = "red")
points(time,subset$Sub_metering_3,type = "l",col = "blue")
legend("topright",names(subset)[7:9],lty=c(1,1,1),lwd=c(2,2,2),col = c("black","red","blue"))

plot(time,subset$Global_reactive_power,type = "l",ylab = "Global_Reactive_Power",xlab = "datetime")   ##to plot 4th graph
dev.off()