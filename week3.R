#Challenge 1: X is a random number generated from normal distribution. Print X if x is over 7.
x <- rnorm(1,mean=5,sd=5)
#your code:
if (x > 7) {x}

#Challenge 2: Let’s bring back the gapminder data, use an if() statement to print a suitable message reporting whether there are any records from 2012 in the gapminder dataset.
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
#your code:
if (2012 %in% gapminder$year) {
  message("2012 exists")
} else {
    message("2012 doesnt exist")
  }

#Challenge 3: Save all possible combinations of day and month in vector “Day” and “Month”, and save values in the DayMonth vector, i.e. “10 Jan”, “15 Jan”, “25 Jan”… (hint: you would need to use the paste function)
Day<-c(10,15,25,30)
Month<-c("Jan", "Feb", "March","June" )
DayMonth <- c()
# your code: 
for (i in seq_along(Day)){
  for (j in seq_along(Month)){
    DayMonth <- c(DayMonth, paste(Day[i], Month[j], sep = " "))
  }
}
rm(i,j)

#Challenge 4: How could you change your code in the previous task to an non-growing way? (hint: you can save results in a matrix first)
DayMonth <- matrix(nrow = 5, ncol = 5)
# your code:
for (i in seq_along(Day)){
  for (j in seq_along(Month)){
    DayMonth[i,j] <- paste(Day[i], Month[j], sep = " ")
  }
}

#Challenge 5: Print first 9 numbers between 5 and 55 that can be divided by 3.
#your code:
x <- 5
result <- c()
while(x < 55 && length(result) < 10){
  if (x %% 3 == 0){
    result <- c(result, x)
  }
  x <- x + 1
}
print(result)

#Challenge 6
t1 <- Sys.time()
thresholdValue <- 50
for( iCountry in unique(gapminder$country) ){
  tmp <- mean(subset(gapminder, country==iCountry)$lifeExp)
  if(tmp < thresholdValue){
    cat("Average Life Expectancy in", iCountry, "is less than", thresholdValue, "\n")
  }
  else{
    cat("Average Life Expectancy in", iCountry, "is greater than or equal to", thresholdValue, "\n")
  } # end if else condition
  rm(tmp)
} # end for loop
t2 <- Sys.time()
difftime(t2,t1)

#use ifelse instead of full-form if, cut down time by half
t1 <- Sys.time()
thresholdValue <- 50
for( iCountry in unique(gapminder$country) ){
  tmp <- mean(subset(gapminder, country==iCountry)$lifeExp)
  ifelse(tmp > thresholdValue, paste(iCountry, "greater than 50", sep = " "), paste(iCountry, "less than 50", sep = " ")) # end if else condition
  rm(tmp)
} # end for loop
t2 <- Sys.time()
difftime(t2,t1)

# use dataframe to get rif of FOR loop, cut down time by 1/6
# HOW TO CUT IT DOWN TO 1/100?
t1 <- Sys.time()
thresholdValue <- 50
#my_df <- data.frame(gapminder$country, gapminder$lifeExp)
meanExp <- aggregate(gapminder.lifeExp ~ gapminder.country, data = gapminder, mean)
ifelse(meanExp$gapminder.lifeExp > thresholdValue, paste(meanExp$gapminder.country, "greater than 50", sep =" "), paste(meanExp$gapminder.country, "less than 50", sep =" "))
t2 <- Sys.time()
difftime(t2,t1)

# Challenge 7: Define a function fahr_to_kelvin that converts temperatures from Kelvin to Celsius:
# your code:
fahr_to_celsius <- function(tempF){
  celsius <- (tempF - 32) * (9/5)
  return(celsius)
}

kelvin_to_celsius <- function(tempK){
  celsius <- (tempK - 273.15)
  return(celsius)
}


calcGDP <- function(dat, year=NULL, country=NULL) {
  if(!is.null(year)) {
    dat <- dat[dat$year %in% year,]
  }
  if (!is.null(country)) {
    dat <- dat[dat$country %in% country,]
  }
  #dat$gdp <- dat$pop * dat$gdpPercap
  dat
}

# Challenge 8: Define an function that report different trends in two variables in a given data set by third variable. i.e. with the gapmind data, find countries with increasing population but decreasing life expectancy or decreasing population but increasing life expectancy.
# your code:
my_function <- function(dat, decrease, increase){
  dec <- by(dat$lifeExp, dat$country, function(x){all(x == cummin(x))})
  inc <- by(dat$pop, dat$country, function(x){all(x == cummax(x))})
  indices <- dec == inc
  #return(indices)
  return(dat$country[indices])
}

