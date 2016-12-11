url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url,temp,method = "auto")
con <- unzip(temp)
data <- read.csv(con,sep = ";" , na.strings = c("?"))
unlink(temp)

subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png("plot1.png",480,480)
hist(subset$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red")
dev.off()
