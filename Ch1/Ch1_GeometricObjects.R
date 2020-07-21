library(tidyverse)


#Plot 2 layers of data
#Scatterplot == geom_point()
#Smooth line plot == geom_Smooth()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

#Remove range of Confience Interval for geom_Smooth
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE)


#Scatterplot
#Smooth line plot with linetype and colour differentiation
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, colour = drv))


#Read a simple x-y line
myData = read.csv("line.csv")
myData

#Use geom_line()
ggplot(myData) + 
  geom_line(mapping = aes(x = data1, y = data2))

#USe geom_area() == area chart
ggplot(myData) + 
  geom_area(mapping = aes(x = data1, y = data2))

#################################################33
#Question 6
ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), size = 4) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE, colour = "blue")

ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), size = 4) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), se = FALSE, colour = "Blue")

ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv), size = 4) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv, colour = drv), se = FALSE)

ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv), size = 4) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE)

ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv), size = 4) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE)

ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = drv), size = 4)
