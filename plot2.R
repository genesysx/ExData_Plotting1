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

png(filename="plot2.png",
    width=480,
    height=480,
    units="px")

plot(x=subhpc$DateTime, 
     y=subhpc$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l")

dev.off()