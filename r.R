# gráfica 1


graficas <- read_csv("C:/Users/vusugac/Desktop/household_power_consumption.txt",skip=1,sep=";")
View(graficas)
graficas <- read_table("household_power_consumption.txt",skip=1,sep=";")
names(graficas) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subgraficas <- subset(graficas,graficas$Date=="1/2/2007" | graficas$Date =="2/2/2007")


hist(as.numeric(as.character(subgraficas$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

title(main="Global Active Power")

# gráfica 2

subgraficas$Date <- as.Date(subgraficas$Date, format="%d/%m/%Y")
subgraficas$Time <- strptime(subgraficas$Time, format="%H:%M:%S")
subgraficas[1:1440,"Time"] <- format(subgraficas[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subgraficas[1441:2880,"Time"] <- format(subgraficas[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subgraficas$Time,as.numeric(as.character(subgraficas$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")

# gráfica 3

subgraficas$Date <- as.Date(subgraficas$Date, format="%d/%m/%Y")
subgraficas$Time <- strptime(subpower$Time, format="%H:%M:%S")
subgraficas[1:1440,"Time"] <- format(subgraficas[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subgraficas[1441:2880,"Time"] <- format(subgraficas[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(subgraficas$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subgraficas,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subgraficas,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subgraficas,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


title(main="Energy sub-metering")

# gráfica 4


subgraficas$Date <- as.Date(subgraficas$Date, format="%d/%m/%Y")
subgraficas$Time <- strptime(subgraficas$Time, format="%H:%M:%S")
subgraficas[1:1440,"Time"] <- format(subgraficas[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subgraficas[1441:2880,"Time"] <- format(subgraficas[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


par(mfrow=c(2,2))

with(subgraficas,{
  plot(subgraficas$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subgraficas$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subgraficas$Time,subgraficas$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subgraficas,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subgraficas,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subgraficas,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subgraficas$Time,as.numeric(as.character(subgraficas$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})




