# First we need data; let's pull alr3
library("alr3", lib.loc="~/R/x86_64-redhat-linux-gnu-library/3.5")
data(UN2)
UN2 # UN2 has data of countries' fertility, percentage urban, and logPPgdp

summary(UN2) # gives you min, median, mean, max, and quartiles for each numeric colum

print(var(UN2))

# how many countries' have logFertility values greater than the mean and median?

# list of countries having logFertility greater than the mean
sum(UN2$logFertility > mean(UN2$logFertility))
# displaying the countries
UN2[UN2$logFertility > mean(UN2$logFertility),]


# got waves data using 

data
summary(data)

library(ggplot2)
plot(data$x, data$y, main = 'Waves', xlab = 'Longitude', ylab='Latitude')

sum(data$wave_height > 15)

# tells us the indecies
BigWaves = which(data$wave_height > 15)

# pointing to the Big Waves
points(data$x[BigWaves], data$y[BigWaves], col='blue')

