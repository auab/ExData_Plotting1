#Change the days of the week to english
Sys.setlocale("LC_TIME", "English")
#-------------------------------------
#Upload and treat the necessary data
original_data <- read.csv2(file="exdata_data_household_power_consumption/household_power_consumption.txt")
reduced_data <- subset(original_data,(original_data$Date=="1/2/2007"|original_data$Date=="2/2/2007"))
plot_time <- as.POSIXct(paste(reduced_data$Date, reduced_data$Time), format="%d/%m/%Y %T")
#-------------------------------------
#Open the graphical device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
#-------------------------------------
#Create the graph
plot(plot_time,as.numeric(as.character(reduced_data$Global_active_power)),type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
#-------------------------------------
# Shut down the device
dev.off()