
# Download and install packages
install.packages("dslabs")
library(dslabs)

# Class of the object
class(murders)

# get info about the structure of the object
str(murders)

# head of the object
head(murders)

# access to columns of the dataframe
murders$population

# names of the variables
names(murders)

# length of inputs in the vector
pop <- murders$population
length(pop)
class(pop)           # OUT: "numeric"
class(murders$state) # OUT: "character"

# FACTORS: data categorics
class(murders$region)  # [1]: "factor"
levels(murders$region) # [1] "Northeast"     "South"         "North Central" "West"
# r stored this levels how numbers entires and maintenance ona map to 
#  keep track od the lablels


# EXAMPLE: see levels of the region order by number of the murders
# instead of order alfabetic

region <- murders$region
region

value <- murders$total
value 

region <- reorder(region, value, FUN = sum)
region

levels(region)


#-------------------------------------------

# LISTS
record <- list(name = "John Doe",
               student_id = c(95, 82, 91, 97, 93),
               final_grade = "A")
record
class(record)
# forms of acces to values
record$student_id
record[["student_id"]]

#------------------------------------------

# MATRIZ
mat <- matrix(1:12, 4, 3)
mat # show all data
# acces to data in matrix by index
mat[2,3] # see data by row, column
mat[2, ] # all row
mat[, 3] # all column
mat[1:2, 2:3] # segment of row, columns

# matrix to dataframe
as.data.frame(mat)
data("murders")
murders[25, 1]
murders[2:3, ]

# EXERCICIES
# load data murders of EE.EE
library(dslabs)
data(murders)
str(murders)

# numbers of states
length(murders$state)
murders

# VECTORS
codes <- c(380, 124, 818)
codes

country <- c("italy", "canada", "egypt")
country

codes <- c(italy = 380, canada = 124, egypt = 818)
codes

class(codes)
names(codes) <- country
codes

seq(1, 10)
seq(1, 10, 0.5)
class(seq(1, 10, 0.5))

codes[2]
codes[c(1,3)]
codes[1:2]
codes["canada"]
codes[c("egypt", "italy")]


# entrance with the max values
max(murders$total)

# index with the max value
i_max <- which.max((murders$total))
i_max. # index
murders$state[i_max] # value in the index

# two vectors

#--------------------------------------------------------------
# OPERATIONS LOGICS

TRUE & TRUE
TRUE & FALSE
FALSE * TRUE
TRUE * TRUE

murder_rate <- murders$total/ murders$population * 100000
murder_rate # values

# for each value in region of murders, if value == "West" then TRUE else FALSE
west <- murders$region == "West"
west

# for each value in murder_rate if value < 1 then TRUE else FALSE
safe <- murder_rate <= 1
safe

# Compate the values, assign operations logics by index
ind <- safe & west
ind

# value by index where ind is TRUE
murders$state[ind]
murders$state



# plot
library(dslabs)
data(murders)
str(murders)

x <- murders$population/10^6
y <- murders$total
# plot scatterplot
plot(x, y)
with(murders, plot(population, total))

# plot histogram
x <- with(murders, total/ population * 100000)
hist(x)

# boxplot
murders$rate <- with(murders, total/ population * 100000)
boxplot(rate~region, data = murders)

# image
x <- matrix(1:120, 12, 10)
image(x)
