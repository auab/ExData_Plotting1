#Upload and treat the necessary data
original_data <- read.csv2(file="exdata_data_household_power_consumption/household_power_consumption.txt")
reduced_data <- subset(original_data,(original_data$Date=="1/2/2007"|original_data$Date=="2/2/2007"))
#-------------------------------------
#Open the graphical device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
#-------------------------------------
#Create the graph
hist(as.numeric(as.character(reduced_data$Global_active_power)),col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")
#-------------------------------------
# Shut down the device
dev.off()