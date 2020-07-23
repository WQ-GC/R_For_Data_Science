library(tidyverse)

#diamonds == data from ggplot2
View(ggplot2::diamonds)


#Sort bars into cut variable
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))


ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, colour = cut)) +
  geom_smooth(mapping = aes(x = carat, y = price), se = FALSE)


#stat_count (default stat for geom_bar)
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

#Implement a different stat function for geom_bar
#declare a new data
demo <- tribble(
  ~a,     ~b,
  "Bar1", 20,
  "Bar2", 30,
  "Bar3", 40,
)

View(demo)
typeof(demo)

#using identity stat for geom_bar
ggplot(demo) + 
  geom_bar(mapping = aes(x = a, y = b), stat = "identity")


#default diamonds
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
#Set y-axis as a proportional value
#y = ..prop..
#summation gives 1
ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1, fill = color))


#Statistics Summary
ggplot(data = diamonds) + 
  stat_summary(mapping = aes(x = cut, y = depth),
               fun.min = min,
               fun.max = max,
               fun = median)

#Another form for Statistics Summary above
# ggplot(diamonds) + 
#   geom_pointrange(mapping = aes(x = cut, y = depth),
#                                 ymin = min(diamonds['depth']),
#                                 ymax = max(diamonds['depth']))


#carat wrt geom_bar with stat = "bin"
ggplot(diamonds, aes(x = carat)) +
  geom_bar(stat = "bin")

#carat wrt stat_bin with geom = "bar"
ggplot(diamonds, aes(x = carat)) +
  stat_bin(geom = "bar", binwidth = 0.1)

#carat wrt stat_bin with geom = "bar"
ggplot(diamonds, aes(x = carat)) +
  stat_bin(geom = "bar", bins = 100)


#Default
ggplot(diamonds) + 
  geom_bar(mapping = aes(x = carat), stat = "bin", binwidth = 0.1)
#geom_col (carat-price)
ggplot(diamonds) +
  geom_col(mapping = aes(x = carat, y = price))
#geom_col (carat-cut)
ggplot(diamonds) +
  geom_col(mapping = aes(x = carat, y = cut))
#geom_col (cut-carat)
ggplot(diamonds) +
  geom_col(mapping = aes(x = cut, y = carat))

###############################################
#Parition by cut and Fill Outline colour with cut
ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, color = cut))

#partition by cut, and fill with cut
ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

#Partition by cut and Fill colour breakdown by clarity
#default position = "stacked"
ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#Partition by cut and Fill colour breakdown by clarity
#modify position = "identity" - NOT SO USEFUL
#ggplot(diamonds) + 
#  geom_bar(mapping = aes(x = cut, fill = clarity), position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, color = clarity)) +
  geom_bar(fill = NA, position = "identity")

#modify position = "dodge"
ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#modify position = "fill" == normalised to 1 and stacked
ggplot(diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")


#Modification for data overlapping
#Using Car data modify position = "jitter"
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

#another representation of jittering data set
ggplot(mpg) +
  geom_jitter(mapping = aes(x = displ, y = hwy))


####################################################
#Question 1
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()

####################################################
#Question 2
#Set jitters in both direction = 0
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_jitter(width = 0, height = 0)

#Add Jitter in x by 0.5
ggplot(mpg, aes(x = cty, y = hwy, colour = hwy)) +
  geom_jitter(width = 0.5, height = 0)

#Add Jitter in y by 0.5
ggplot(mpg, aes(x = cty, y = hwy, colour = hwy)) +
  geom_jitter(width = 0, height = 0.5)

#Add Jitter in x by 0.5 and y by 0.5
ggplot(mpg, aes(x = cty, y = hwy, colour = hwy)) +
  geom_jitter(width = 0.5, height = 0.5)


####################################################
#Question 3
#default displ-hwy
ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
#with geom_count
ggplot(mpg) + 
  geom_count(mapping = aes(x = displ, y = hwy))

####################################################
#Question 4 ?
ggplot(mpg, mapping = aes(y = hwy)) +
  geom_boxplot()

