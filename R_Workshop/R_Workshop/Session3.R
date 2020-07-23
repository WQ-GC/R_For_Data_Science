library(tidyverse)

View(mpg)

#Global colour
ggplot(mpg, aes(x = displ, y = hwy, colour = class)) + 
  geom_point()

#Local colour
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(colour = "blue")

#Scatter Plot
plot1 = ggplot(mpg, aes(x = displ, y = hwy))
plot1 + geom_point(aes(colour = class, shape = fl))

plot1 + geom_point(aes(colour = cyl, shape = fl))

##############################
#economics == ggplot2 data
View(ggplot2::economics)
plot2 = ggplot(economics, aes(date, unemploy))
plot2 + geom_line()

#another format
ggplot(economics, aes(date, unemploy)) +
  geom_line() + 
  ylab("Number of Unemployed [in thousands]") +
  xlab("Year")

#Add dotted line and increase size
ggplot(economics, aes(date, unemploy)) +
  geom_line(linetype = 2, size = 1) + 
  ylab("Number of Unemployed [in thousands]") +
  xlab("Year")

#mpg add in a Linear Line for x-y
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


#mpg add in a Loess Line for x-y
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "loess")


#mpg Bar geometry wrt car's class
ggplot(mpg, aes(x = class, fill = class)) + 
  geom_bar()

#mpg Normalise Proportions
ggplot(mpg, aes(x = class)) + 
  geom_bar(aes(y = stat(prop), group = 1))

#Historgram (bin size = 30)
ggplot(mpg, aes(x = hwy)) +
  geom_histogram()

#Histogram, x = hwy
#y = density
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(aes(y = stat(density)))


#Plot with geom_density
#kernel = "gaussian" by default
ggplot(mpg, aes(x = hwy)) +
  geom_density()


#Boxplot
ggplot(mpg, aes(x = trans, y = hwy)) +
  geom_boxplot()

#Force cyl to be a factor
#cyl == number of cylinders
cylData = as.factor(mpg[['cyl']])
View(cylData)
typeof(cylData)
ggplot(mpg, aes(x = cylData, y = hwy)) +
  geom_boxplot()

#QQ Plots
ggplot(mpg, aes(sample = hwy)) +
  geom_qq() +
  geom_qq_line()