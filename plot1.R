# -------------------------------------------------------------------
# FILE: plot1.R
# Course: Exploratory Data Analysis
# Project: 1
#
# R script to generate the first plot for the project.
#
# To run this script you will need to have the project data file 
# household_power_consumption.txt in your working directory and
# have your working directory set properly. Setting the working_dir
# varibale should be the only change needed.
#
# -------------------------------------------------------------------
# CHANGELOG:
# 2015-05-06 File created.
# -------------------------------------------------------------------


# * Initializations *
# *******************

# set working_dir variable
working_dir <- "~/Documents/courses/exploratory_data_analysis/ExData_Plotting1"

# set working directory
setwd(working_dir)

# libraries
library(dplyr)

# * Read the household power consumption data *
# *********************************************
# activities
hpc_full <- read.table(
  file = "household_power_consumption.txt",
  sep = ";",
  stringsAsFactors = FALSE,
  header = TRUE)

# get data for February 1st and 2nd 2007
hpc_subset <- filter(hpc_full, Date %in% c("1/2/2007","2/2/2007"))

# remove hpc_full data table
rm(hpc_full)
