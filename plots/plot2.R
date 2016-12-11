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

png("plot2.png",480,480)
plot(time,subset$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()
