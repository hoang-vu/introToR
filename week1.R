log(1)
exp(1)
log(5, base = 2)
log(5, base = 10)
mass <- 40
age <- mass + 10
mass <- mass *2
ls()
rm(list = ls())
#install.packages("ggplot2")
#install.packages("dplyr")
x <- "dataset"
y <- 555.55
z <- as.integer(y)
class(x)
class(y)
class(z)
typeof(x)
typeof(y)
typeof(z)
vector("numeric", length = 5)

z <- c("Sarah","Tracy","Jon")
#Challenge 10: Add name “Annette” to vector z
z <- c(z, "Annette")

temperature <- c(30, 29, 20, 15, 40)
names(temperature) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
#Challenge 11: Retrieve first 3 values in vector “temperature”. Extract values for Wednesday using vector name.
temperature[1:3]
temperature[match("Wednesday", names(temperature))]
#Use an index vector c("Wednesday","Thursday") for multiple names

#Challenge 12: Find out what would happen if an index is out-of-range
temperature[6] #NA value

#Challenge 13: Create a vector for average temperature in Melbourne for each month
temperature <- c(21, 21, 19, 17, 14, 11, 10, 11, 13, 15, 17, 19)
names(temperature)<-month.abb
temperature

#Challenge 14: Find out which month has the maximum temperature
temperature[which.max(temperature)]

#Challenge 15: Find out the temperature difference between the month with maximum temperature and the month with minimum temperature.
temperature[[which.max(temperature)]] - temperature[[which.min(temperature)]]
