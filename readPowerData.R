setwd('/windows/coursera/DS4 Eploratory Data Analysis/project1/repo')

data <- read.table(
  'household_power_consumption.txt',
  sep = ';',
  as.is = T, # Don't turn things into factors
  na.strings = c('?'), # '?' should be interpreted as NA
  # There are two string columns that will later be converted
  # into datetime values, followed by seven numeric columns
  colClasses = c(rep('character', 2), rep('numeric', 7)),
  skip = 66637, # 2007-02-01 starts on 66638
  nrows = 69518 - 66638, # First row of 2007-02-03, minus first of 2007-02-01
  header = F, # Don't use a header, since we skipped it
  col.names = c( # Name the columns appropriately
    'datestring', 'timestring', 'power.active', 'power.reactive',
    'voltage', 'intensity', 'sub1', 'sub2', 'sub3'
  )
)
# Combine the date and time strings, and convert them to a single datetime
data$datetime <- strptime(
  paste(data$datestring, data$timestring),
  format = '%d/%m/%Y %H:%M:%S'
)
# Remove the now-redundant date and time columns
data$date <- data$time <- NULL
