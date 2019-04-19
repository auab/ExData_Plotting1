#Change the days of the week to english
Sys.setlocale("LC_TIME", "English")
#-------------------------------------
#Upload and treat the necessary data
original_data <- read.csv2(file="exdata_data_household_power_consumption/household_power_consumption.txt")
reduced_data <- subset(original_data,(original_data$Date=="1/2/2007"|original_data$Date=="2/2/2007"))
plot_time <- as.POSIXct(paste(reduced_data$Date, reduced_data$Time), format="%d/%m/%Y %T")
#-------------------------------------
#Open the graphical device
png(filename = "plot4.png", width = 480, height = 480, units = "px")
#-------------------------------------
#Create the graph - Set the number of plots
par(mfrow = c(2,2))
#Plot 1
  plot(plot_time,as.numeric(as.character(reduced_data$Global_active_power)),type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
#Plot 2
  plot(plot_time,as.numeric(as.character(reduced_data$Voltage)),type="l",xlab = "datetime",ylab = "Voltage")
#Plot 3
  plot(plot_time,as.numeric(as.character(reduced_data$Sub_metering_1)),type="n",xlab = "",ylab = "Energy sub metering")
  lines(plot_time,as.numeric(as.character(reduced_data$Sub_metering_1)),col="black")
  lines(plot_time,as.numeric(as.character(reduced_data$Sub_metering_2)),col="red")
  lines(plot_time,as.numeric(as.character(reduced_data$Sub_metering_3)),col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot 4
  plot(plot_time,as.numeric(as.character(reduced_data$Global_reactive_power)),type="l",xlab = "datetime",ylab = "Global Active Power (kilowatts)")
#-------------------------------------
# Shut down the device
dev.off()
