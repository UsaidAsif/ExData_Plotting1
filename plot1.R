data <- read.table("household_power_consumption.txt", sep = ";", header = T)
head(data)
png("plot1.png", 480,480)
library("dplyr")
df <- mutate(data, formattedDate1 = as.Date(data$Date, format = "%d/%m/%Y"))
df <- filter(df, df$formattedDate1 == "2007-02-01" | df$formattedDate == "2007-02-02")
gpa <- filter(df, (df$Global_active_power != "?"))
hist(as.numeric(as.character(gpa$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
