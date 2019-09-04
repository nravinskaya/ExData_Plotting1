## downloading and unpacking
zipFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipFileUrl, destfile="Dataset.zip", mode="wb")
unzip(zipfile = "Dataset.zip")

## reading into R and subsetting
probadata <- read.table("./household_power_consumption.txt", header=T, sep = ";", na.strings = "?")
subsetprobadata <- probadata[(probadata$Date == "1/2/2007" | probadata$Date == "2/2/2007"),]

## conversion the Date and Time variables from character representations to Date/Time class
datetime <- strptime(paste(subsetprobadata$Date,subsetprobadata$Time), "%d/%m/%Y %H:%M:%S")
mydata <- cbind(datetime, subsetprobadata[,-c(1,2)])

## plot
png(filename="plot1.png", width = 480, height = 480)
hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
