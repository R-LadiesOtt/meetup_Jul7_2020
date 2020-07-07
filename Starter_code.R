#### R-ladies Ottawa meetup
### July 7, 2020

## Useful Packages
library(dplyr)


.#download github repo
#install.packages("devtools") 
devtools::install_github("hadley/neiss") #you might need to run the previous line


# Load the injuries data set
injuries_data <- neiss::injuries

# View the structure of the data
str(injuries_data)

# View column names
colnames(injuries_data)

## Some useful tidyverse functions examples for data cleaning
# filterfor injuries that relate to the face
injuries_clean <- filter(injuries_data, body_part == "face")
# select certain variables to keep
injuries_clean <- select(trmt_date, age, body_part, diag, diag_other, location)
# create new variables based on exising ones (here create age group categories)
injuries_clean <- mutate(age_categ = if_else(age <= 15, "15 and under",
                                             if_else(age <= 64, "15 to 64",
                                                     "65 and over")))

