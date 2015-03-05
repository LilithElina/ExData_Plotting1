# Set language to English for exact copy of the example plot
Sys.setlocale("LC_TIME", "C")

# Read in the relevant data (Feb 1st and 2nd in 2007)
data <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrow=2880)

# Set comprehensive column names
colnames(data) <- c("date", "time",
                    "global_active_power", "global_reactive_power",
                    "voltage", "global_intensity",
                    "sub_metering1", "sub_metering2", "sub_metering3")

# Merge date and time column
data$datetime <- paste(data$date, data$time)

# Convert date and time format
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")

# Create plot and save as PNG
png("plot2.png", width=480, height=480, units="px")
plot(data$datetime, data$global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
