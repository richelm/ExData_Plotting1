# -------------------------------------------------------------------
# FILE: plot2.R
# Course: Exploratory Data Analysis
# Project: 1
#
# R script to generate the second plot for the project.
#
# To run this script you will need to have the project data file 
# household_power_consumption.txt in your working directory and
# have your working directory set properly. Setting the working_dir
# variable should be the only change needed. The plot generated,
# plot2.png, too will be in the working directory.
#
# Required packages: dplyr and lubridate
#
# -------------------------------------------------------------------
# CHANGELOG:
#   2015-05-06 File created.
# -------------------------------------------------------------------
#
# Initializations
# 
# set working_dir variable
working_dir <- "~/Documents/courses/exploratory_data_analysis/ExData_Plotting1"

# set working directory
setwd(working_dir)

# libraries
library(dplyr)
library(lubridate)

#
# Read the household power consumption data
#
hpc_full <- read.table(
  file = "household_power_consumption.txt",
  sep = ";",
  stringsAsFactors = FALSE,
  header = TRUE)

# get data for February 1st and 2nd 2007
hpc <- filter(hpc_full, Date %in% c("1/2/2007","2/2/2007"))

# remove hpc_full data table
rm(hpc_full)

# clean up the column names; remove underscores and convert to lower case
colnames(hpc) <- tolower(gsub("\\_","",colnames(hpc),perl=TRUE))

# convert character data to numeric
numeric.columns <- c("globalactivepower",
                     "globalreactivepower",
                     "voltage",            
                     "globalintensity",
                     "submetering1",
                     "submetering2",
                     "submetering3")
hpc[numeric.columns] <- sapply(hpc[numeric.columns],as.numeric)

# add datetime column using lubridate function dmy_hms()
hpc$datetime = dmy_hms(paste(hpc$date, hpc$time))

#
# generate PNG plot
#
# open graphics device
png("plot2.png",
    width = 480,
    height = 480)

# generate the plot
plot(hpc$datetime,hpc$globalactivepower,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# close graphics device
dev.off()
