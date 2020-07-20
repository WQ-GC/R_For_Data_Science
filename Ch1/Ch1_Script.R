library(tidyverse)

#mpg == Miles Per Gallon Data Frame
#View(ggplot2::mpg)

ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
#disp == Engine size [litres]
#hwy == Fuel Efficiency for travelling in highway [miles per gallon]


#Plot of hwy vs cyl
#cyl == number of cylinders
#hwy == Fuel Efficiency for travelling in highway [miles per gallon]
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy))


#Plot using aesthetic - colour attribute for class variable
ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

#Plot using aesthetic - shape attribute for class variable
ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#Plot using aesthetic - size attribute for class variable
ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

#Plot using aesthetic - alpha attribute for class variable
ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))


#Plot all points with Red - declared in geom_point
ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), colour = "red")


#Plot with Green - declared in geom_point
#"Green" or "GREEN" or "green" acceptable
ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), colour = "Green")


#Test Size
ggplot2::ggplot(data = ggplot2::mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), shape = 0)


#Test Size for displ vs cyl with cty as colour
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, colour = cty))

#Test Size for displ vs cyl with cty as size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, size = cty))

#Test Size for displ vs cyl with cty as shape
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, shape = cty))



###############################################
#Test Size for displ vs cyl with cty as colour
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, colour = cty))

#Test Size for displ vs cyl with cty as size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, size = cty))

#Test Size for displ vs cyl with cty as shape
#not possible to map
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, shape = cty))


#Combined effect for cyl as y-axis, colour and size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, colour = cyl, size = cyl))

###############################################
#Test Size for displ vs cyl with manufacture as colour
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, colour = manufacturer))

#Test Size for displ vs cyl with manufacture as shape
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, shape = manufacturer))

#Test Size for displ vs cyl with manufacture as size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, size = manufacturer))


###############################################
#geom_point
#shape property   == 1 to 25th shape
#stroke property  == border for some shapes
#colour property  == colour of point's border
#fill property    == fill for point

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl), shape = 23, 
             colour = "black", fill = "blue", stroke = 10)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl), shape = 23, 
             colour = "black", fill = "red", stroke = 3)


#Conditionally map x into TRUE or FALSE
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = cyl, colour = displ < 5))


#Ensure the condition falls within the range
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ < 5, y = cyl))




#Separate plots by Facets
#Split plots into 2 rows
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~class, nrow = 2)

#Split plots into 3 rows
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~class, ncol = 3)


#Facet the original plot into another 2 dimensions
#displ-hwy into drv-cyl
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv~cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))



#Single Dimension Facet Grid on x-axis
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(.~cyl)

#Single Dimension Facet Grid on y-axis
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(cyl~.)


#Single Dimension Facet Grid (another form)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~cyl, nrow = 1)


#Facet on continous variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~cty)


#################################################################
#Colour Plots vs Facet
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class)) 
  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(.~class)
