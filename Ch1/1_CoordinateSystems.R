library(tidyverse)

#Coordinate Systems

#Tranpose x-axis -> y-axis
ggplot(mpg, aes(x = class, y = hwy)) + 
  geom_boxplot() + 
  coord_flip()

######################################################
nz = map_data("nz")
View(nz)
#Without aspect scaling
ggplot(nz, aes(long, lat, group = group, colour = region)) + 
  geom_polygon(fill = "white") 

#with coord_quickmap() to scale to aspect ratio
ggplot(nz, aes(long, lat, group = group, colour = region)) + 
  geom_polygon(fill = "white") + 
  coord_quickmap()

######################################################
bar = ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut),
           show.legend = FALSE,
           width = 1
           ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)
bar
bar + coord_flip()  #Transpose axis
bar + coord_polar() #Plot in Polar Coordinate

######################################################
#Question 1
View(diamonds)

ggplot(diamonds, aes(x = cut, y = price)) +
  geom_point()

ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar()

#Question 2
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar() +
  labs(
    tag      = "Top Left Tag", 
    title    = "Title", 
    subtitle = "Subtitle",
    x        = "x-axis",
    y        = "y-axis",
    caption  = "Caption"
  )  

#Add axis
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar() +
  xlab("x-axis") +
  ylab("y-axis")

#Using ggtitle()
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar() +
  ggtitle(label = "The Label", 
          subtitle = "Subtitle")
  
##################################################
#Question 3
library(mapproj)

if (require("maps")) {
  nz <- map_data("nz")

  # Prepare a map of NZ
  nzmap <- ggplot(nz, aes(x = long, y = lat, group = group)) +
            geom_polygon(fill = "white", colour = "black")
  
  #Plot it in cartesian coordinates
  nzmap

  #With the aspect ratio approximation
  #coord_quickmap is a quick approximation that 
  #does preserve straight lines. 
  #It works best for smaller areas closer to the equator.
  nzmap + coord_quickmap()

  #With correct mercator projection
  #Map projections do not, in general, preserve straight lines, 
  #so this requires considerable computation
  nzmap + coord_map()
}

######################################################
#Question4
loadData = mpg
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point() +
  coord_fixed() + #default coord system is 1-x to 1-y
#  geom_abline(intercept = 0, slope = 1.3, colour = "red") #default abline =  
  geom_abline(intercept = 0, slope = 1) #default abline, intercept = 0, slope = 1


# Calculate SLOPE & INTERCEPT of line of best fit
#mtcars == a dataset
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
coef(lm(mpg ~ wt, data = mtcars))
p + geom_abline(intercept = 37, slope = -5)
# But this is easier to do with geom_smooth:
p + geom_smooth(method = "lm", se = FALSE)
