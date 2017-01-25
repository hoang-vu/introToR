# create ses variable
ses <- c("low", "middle", "low", "high", "low", "low", "low", "middle", "low","middle", "middle", "middle", "middle", "middle")
ses.f <- factor(ses)
# check levels
levels(ses.f)
# order levels
ses.f <- factor(ses, levels = c("low", "middle", "high"))
levels(ses.f)

# Challenge 1: Crate a factor variable for type as type.f and label 0 as “private” and 1 as “public”.
# from a numaric vector
type<-c(1,0,0,0,1,1,0,1)
type.f <- factor(type, levels = c("0", "1"), labels = c("public","private"))
type.f

# Challenge 2: Adding levels 
ses.f <- factor(ses, levels = c("low","middle","high","very.high"))
ses.f[15] <- "very.high"


# Challenge 3: Drop the level very.high via converting very.high to NA
table(ses.f)
levels(ses.f)[4] <- NA
table(ses.f)

m <- matrix(1:6, nrow = 2, ncol = 2)
m
dim(m)
typeof(m)
class(m)
x <- 1:3
y <- 10:12
cbind(x,y)
x <- list(1, "a", TRUE, 1+4i)
y <- as.list(x)
xlist <- list(a = "Karthik Ram", b = 1:10, data = head(iris))
xlist$b
xlist[[2]]
xlist[2]
dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)
dat

exam<-list(name=c("Caroline","Caitlin", "David"),exam1=c(50,99,80),exam2=c(40,NA,100), Passed=c("N","Y","Y"))
#my_table <- cbind(exam$name, exam$exam1, exam$exam2, exam$Passed)
#my_table
#exam$exam1 > 50 & exam$exam2 > 50 & exam$Passed == "Y"
# Challenge 6
exam<-list(name=c("Caroline","Caitlin", "David"),exam1=c(50,99,80),exam2=c(40,NA,100), Passed=c("N","Y","Y"))
temp_df <- data.frame(exam)
temp_df[is.na(temp_df)] <- 0
index <- rowMeans(temp_df[c(-1, -length(temp_df))]) >= 50
#return the name where errors are made
exam$name[which(index != (temp_df["Passed"] == "Y"))]

# Challenge 7
class(iris)
typeof(iris)

# Challenge 8
iris[1:10,]

# Challenge 9
nrow(subset(iris, iris$Species == "setosa"))

# Challenge 10
new1<-c(1:3)
new2<-1
cars<-rbind(cars,new1)
cars<-rbind(cars,new2)
# cbind doesnt work because cars only has 2 variables.

# Challenge 11
#download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder-FiveYearData.csv")
gapminder <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv")
str(gapminder)
length(gapminder)
# Extract names of countries which have life expectancy below 4s before 1980 (with one line of code)
levels(factor(subset(gapminder, (gapminder$lifeExp < 40 & gapminder$year <= 1980))$country))


# Challenge 12
test <- subset(gapminder, gapminder$continent == "Africa")
tested_country <- levels(factor(test, levels = levels(factor(test$country))))
test
result <- diff(test$lifeExp) > 0
result
all(diff(test$lifeExp) > 0)

