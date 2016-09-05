# Verify the package is installed.
any(grepl("stringr",installed.packages()))

install.packages("RCurl")
install.packages("XML")
install.packages("stringr")
install.packages("plyr")
data()

library(RCurl)
library(XML)
library(stringr)
library(plyr)


# Read the URL.
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)
class(links)
# Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_2015")]
class(filenames)
# Store the file names as a list.
filenames_list <- as.list(filenames)
class(filenames_list)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  print(filedetails)
  download.file(filedetails,filename)
}

class(filenames)

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")

