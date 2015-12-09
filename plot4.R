hpc <- read.table("household_power_consumption.txt",
                  header=TRUE,
                  sep=";",
                  colClasses=c("character",
                               "character",
                               "double",
                               "double",
                               "double",
                               "double",
                               "numeric",
                               "numeric",
                               "numeric"),
                  na.strings="?")

hpc$DateTime = paste(hpc$Date, epc$Time)
hpc$DateTime = as.POSIXlt(hpc$DateTime,format="%d/%m/%Y %H:%M:%S")
hpc$Date = NULL
hpc$Time = NULL

subhpc<-subset(hpc, DateTime$year==107 
               & DateTime$mon==1 
               & (DateTime$mday==1 | DateTime$mday==2))

png(filename="plot4.png",
    width=480,
    height=480,
    units="px")

par(mfcol=c(2,2), mar=c(4,4,2,1))

plot(x=subhpc$DateTime, 
     y=subhpc$Global_active_power,
     ylab="Global Active Power",
     xlab="",
     type="l")

plot(x=subhpc$DateTime, 
     y=subhpc$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="l")

lines(x=subhpc$DateTime,
      y=subhpc$Sub_metering_2,
      col="red")

lines(x=subhpc$DateTime,
      y=subhpc$Sub_metering_3,
      col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lwd="2",
       bty="n",
       cex=0.6)

plot(x=subhpc$DateTime,
     xlab="datetime",
     y=subhpc$Voltage,
     ylab="Voltage",
     type="l")

plot(x=subhpc$DateTime,
     xlab="datetime",
     y=subhpc$Global_reactive_power,
     ylab="Global_reactive_power",
     type="l")

dev.off()