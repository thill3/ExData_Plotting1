#2,075,259 rows and 9 columns.
#Size is approximately
# 2075259 rows
# times
# 9 columns
# times
# 8 bytes per cell
#Gives 149,418,648 bytes
#145,916.6 Kilobytes (or 149418.6)
#142.4967 Megabytes (or 149.4186)
#0.139157 Gigabytes (or .1494186)

# For each plot you should
# Construct the plot and save it to a PNG file with a width of 480 pixels and
#a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the
#corresponding plot, i.e. code in plot1.R constructs the plot1.png plot.
#Your code file should include code for reading the data so that the
#plot can be fully reproduced. You should also include the code that
#creates the PNG file.
# Add the PNG file and R code file to your git repository

a <-
        Sys.time()
householdEnergy <- read.table(
        "household_power_consumption.txt"
        ,
        sep = ";"
        ,
        header = TRUE
        ,
        as.is = TRUE
)
b <- Sys.time()
#as.is argument forces it to load numerics as character rather than factor
class(householdEnergy[, 3])
b - a # Somewhere between 13.0 and 16.8 seconds
names(householdEnergy)
library(lubridate)
analyzeData <- subset(
        householdEnergy
        ,
        dmy(householdEnergy[, 1]) == ymd(20070201) |
                dmy(householdEnergy[, 1]) == ymd(20070202)
)
dim(analyzeData) #2880x9. Exactly what we wanted
GAP <- which(names(analyzeData) == "Global_active_power")
data1 <-
        sapply(analyzeData[, GAP], as.numeric) #This only works because I forced
#the numeric values to load as characters rather than factors.
#plot 1
#Histogram.
#red bars
#ylabel = "Frequency"
#xlab = "Global Active Power (Kilowatts)
#main = "Global Active Power"
png(filename = "plot1.png",
    width = 480,
    height = 480)
hist1 <- hist(data1
              ,
              ylab = "Frequency"
              ,
              xlab = "Global Active Power (Kilowatts)"
              ,
              col = "red"
              ,
              main = "Global Active Power")
dev.off() #have to do this or else I can't view the image
