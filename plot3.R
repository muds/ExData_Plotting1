# Execute the script that loads the data into the data.frame 'data'
source('readPowerData.R')

# Create a new PNG file 'device' with required width and height
png(
  filename = 'plot3.png',
  width = 480,
  height = 480
)

# The third plot will contain three lines of different colours, though the
# initial call to plot() here uses the default ('black') for the first of
# the three lines
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
  col = c('black', 'red', 'blue'), # Specify the colours in the correct order
  legend = paste0('Sub_metering_', c(1,2,3)) # Build the three similar names
)
dev.off() # Save and close the new PNG file, which is now complete