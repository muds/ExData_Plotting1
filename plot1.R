# Execute the script that loads the data into the data.frame 'data'
source('readPowerData.R')

# Create a new PNG file 'device' with required width and height
png(
  filename = 'plot1.png',
  width = 480,
  height = 480,
  bg = 'transparent' # Make the background transparent, instead of white
)

# The first plot is just a standard histogram with the default breaks,
# and a few slightly more descriptive lables
hist(
  data$power.active,
  main = 'Global Active Power', # Plot title
  xlab = 'Global Active Power (kilowatts)', #x-axis label
  col = 'red', # Fill colour of the histogram bars
)
dev.off() # Save and close the new PNG file, which is now complete
