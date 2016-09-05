any(grepl("stringr",installed.packages()))

dog <- "The quick brown dog"
str_to_upper(dog)
str_to_lower(dog)
str_to_title(dog)

# Locale matters!
str_to_upper("i", "en") # English
str_to_upper("i", "tr") # Turkish

numbers <- "1 and 2 and 4 and 456"
num_loc <- str_locate_all(numbers, "[0-9]+")[[1]]
num_loc

str_sub(numbers, num_loc[, "start"], num_loc[, "end"])
text_loc <- invert_match(num_loc)
str_sub(numbers, text_loc[, "start"], text_loc[, "end"])

pattern <- "a.b"
strings <- c("abb", "a.b")
class(strings)
str_detect(strings, pattern)
str_detect(strings, fixed(pattern))
str_detect(strings, coll(pattern))

str_c("Letter: ", letters)
str_c("Letter", letters, sep = ": ")

str_c(letters, " is for", "...")
str_c(letters[-26], " comes before ", letters[-1])

str_c(letters)
str_c(letters, collapse = "")
str_c(letters, collapse = ", ")
# Missing inputs give missing outputs
str_c(c("a", NA, "b"), "-d")
# Use str_replace_NA to display literal NAs:
str_c(str_replace_na(c("a", NA, "b")), "-d")


