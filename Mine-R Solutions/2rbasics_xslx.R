install.packages("xlsx")

# Verify the package is installed.
any(grepl("xlsx",installed.packages()))

# Load the library into R workspace., , set path=C:\Program Files\Java\jre7\bin\server and remove java_home from environment variable

library("rJava")
library("xlsxjars")
library("xlsx")

getwd()

data <- read.xlsx("data files/input.xlsx", sheetIndex = 1) #need not specify full directory, just specify subdirectory
print(data)
class(data)
