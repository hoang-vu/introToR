#Challenge 1: Find the mean lifeExp and gdpPercap of the data set.
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
# your code :
colMeans(gapminder[,c("lifeExp", "gdpPercap")])
apply(gapminder[c(5:6)], 2, mean)

#Challenge 2: Extract the second element of a,b,c with lapply. Hint: use the selection operator “[[”.
x <- list( a = 1:4, b = 2:10, c = 3:14)
x
#your code
lapply(x, function(x) x[[2]])
lapply(x, "[[", 2)
lapply(x, "[", 2)
sapply(x, function(x) x[[2]])

#Challenge 3: Find out the mean lifeExp by country.
sapply(split(gapminder, gapminder$country), function(x) colMeans(x["lifeExp"]))
sapply(split(gapminder$lifeExp, gapminder$country), mean)
tapply(gapminder$lifeExp, gapminder$country, mean)
#Challenge 4: Find out lists of countries with 1,2,3 and 4 years of continious decreasing life expectancy using mapply and the given function.

#a function for max number of continious decreasing years.
numberYears<-function(dat) {
  dat<-rle(dat)
  suppressWarnings(max(dat$length[dat$values==TRUE]))
}
# a function calculate if the number of continious decreasing years in a vector is equal to a given value 
country_decreasing<-function(data,years){
  decreasing<-diff(data)<0
  decreasingyears<-numberYears(decreasing)
  return(decreasingyears==years)
} 

# we will first split lifeExp by country
lifeExp<-split(gapminder$lifeExp,gapminder$country)

# your code:
countries <- mapply(country_decreasing, lifeExp, 1:4)



