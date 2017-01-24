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
