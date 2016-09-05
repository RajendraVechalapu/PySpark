
install.packages("rjson")

# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "data files/employees.json")
result

# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)

json_data_frame

