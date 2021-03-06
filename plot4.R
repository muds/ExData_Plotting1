# Execute the script that loads the data into the data.frame 'data'
source('readPowerData.R')

# Create a new PNG file 'device' with required width and height
png(
  filename = 'plot4.png',
  width = 480,
  height = 480,
  bg = 'transparent' # Make the background transparent, instead of white
)

# This PNG will contain two columns, of two plots each
par(mfcol = c(2,2))

# Top left plot, same as in plot2.R
plot(
  data$datetime, # x values, independent variable
  data$power.active, # y values, dependent variable
  type = 'l', # Create a line plot
  xlab = '', # Don't label the x axis
  ylab = 'Global Active Power (kilowatts)' # y-axis label
)

# Bottom left plot, same as in plot3.R
plot(
  data$datetime, # x values, independent variable
  data$sub1, # First set of y values; more added below after call to plot()
  type = 'l', # Create a line plot
  xlab = '', # Don't label the x axis
  ylab = 'Energy sub metering' # y-axis label
)
# Add the second set of sub metering data to the plot as a red line
lines(
  data$datetime,
  data$sub2,
  col = 'red'
)
# Add the third set as a blue line
lines(
  data$datetime,
  data$sub3,
  col = 'blue'
)
# Create the legend for the plot
legend(
  'topright', # Add it to the top right corner
  lwd = 1, # Use a line width of 1
  bty = 'n', # Don't draw a box
  col = c('black', 'red', 'blue'), # Specify the colours in the correct order
  legend = paste0('Sub_metering_', c(1,2,3)) # Build the three similar names
)

# The new plots start now, though they're basically the same as the top left

# Top right plot, a line plot of voltages
plot(
  data$datetime, # x values, independent variable
  data$voltage, # y values, dependent variable
  type = 'l', # Create a line plot
  xlab = 'datetime', # Don't label the x axis
  ylab = 'Voltage' # y-axis label
)

# Bottom right plot, the last one
plot(
  data$datetime, # x values, independent variable
  data$power.reactive, # y values, dependent variable
  type = 'l', # Create a line plot
  xlab = 'datetime', # Don't label the x axis
  ylab = 'Global_reactive_power' # y-axis label
)

dev.off() # Save and close the new PNG file, which is now complete