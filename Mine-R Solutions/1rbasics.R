print(1+2)
.libPaths()
library()                      
search()
install.packages("XML")
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)
addresses <- cbind(city,state,zipcode)
addresses

new.address <- data.frame(
  city = c("Lowry","Charlotte"),
  state = c("CO","FL"),
  zipcode = c("80230","33949"),
  stringsAsFactors = FALSE
)
new.address

all.addresses <- rbind(addresses,new.address)
all.addresses

addresses
new.address
all.addresses

library(MASS)
data()

merged.Pima <- merge(x = Pima.te, y = Pima.tr,
                     by.x = c("bp", "bmi"),
                     by.y = c("bp", "bmi"))
print(merged.Pima)
nrow(merged.Pima)

library(MASS)
print(ships)

print(getwd())
setwd("F:/MSBI Tutorial/03. Cortona Analytics/R and DataScience/data files")
data <- read.csv("input.csv")
print(data)

data <- read.csv("input.csv")

print(is.data.frame(data))
print(ncol(data))
print(nrow(data))

sal <- max(data$salary)
sal

'Filter
retval <- subset(data, salary == max(salary))
retval

retval <- subset(data, dept == "IT")
retval

retval <- subset(data, dept == "IT" & salary >= 600 )
retval

data

retval <- subset(data, as.Date(start_date) >= as.Date("2014-01-01"))
retval
class(retval)

write.csv(retval,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)

#curernt working directory
getwd()


