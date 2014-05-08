# Execute the script that loads the data into the data.frame 'data'
source('readPowerData.R')

# Create a new PNG file 'device' with required width and height
png(
  filename = 'plot2.png',
  width = 480,
  height = 480,
  bg = 'transparent' # Make the background transparent, instead of white
)

# The second plot displays active power as a function of time
# over the two days of interest
plot(
  data$datetime, # x values, independent variable
  data$power.active, # y values, dependent variable
  type = 'l', # Create a line plot
  xlab = '', # Don't label the x axis
  ylab = 'Global Active Power (kilowatts)' # y-axis label
)
dev.off() # Save and close the new PNG file, which is now complete