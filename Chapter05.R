##############################################################################
# chapter 05 - advanced Data Structures
# allows for complex storage - data.frame, matrix, list, array
# data.frame -> for those familiar with spreadsheets
# matrix -> for those familiar with matrix math
# list -> for those familiar with programming
##############################################################################

##############################################################################
# 5.1 data.frames
# Most commonly used, and has columns and rows. In statistical terms, each
# column is a variable, and each row is an observation. R organizes each
# column as a variable, each of which has the same length. This is important,
# as it allows each column to  hold a different type of data
#
##############################################################################

# construct the data.frame
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "baseball", "curling", "Rugby", "Lacrosse",
       "basketball", "Tennis", "cricket", "Soccer")
the_df <- data.frame(x, y, q)
the_df <- data.frame(First = x, Second = y, Sport = q)

# data frame comes with a lot of attributes. a few of them are listed below
nrow(the_df)       # check number of rows in a data frame
ncol(the_df)       # check number of columns in a data frame
dim(the_df)        # check both number of rows and columns in a data frame
names(the_df)      # check the names of the columns
names(the_df)[3]   # check the names of the 3rd column
rownames(the_df)   # check the names of the row in a data frame
rownames(the_df) <- c("One", "Two", "Three", "Four", "Five", "Six", "Seven",
                      "Eight", "Nine", "Ten") # assign names to each row
rownames(the_df) <- NULL # set them back to generic index
head(the_df)       # prints out the first few rows in a data frame
head(the_df, n = 7)  # prints out the first 7 rows in a data frame
tail(the_df)       # prints out the last few rows in a data frame
class(the_df)      # check the class of a data frame variable
the_df$Sport       # access individual column within a data frame variable
the_df[3, 2]       # access individual elements within a data frame by their
# position (row 3, column 2)
the_df[3, 2:3]     # access more than one elements within a data frame by
# its position (row 3, column 2 to 3)
the_df[c(3, 5), 2] # access rows 3 and 5, column 2. Since only 1 column is
# selected, it was returned as a vector and hence no column names are printed
the_df[c(3, 5), 2:3] # access rows 3 and 5, column 2 through 3
the_df[, 3]        # access all of column 3
the_df[, 2:3]      # access all of column 2 through 3
the_df[2, ]        # access row 2
the_df[2:4, ]      # access row 2 through 4
the_df[, c("First", "Sport")]  # access multiple columns by name
the_df[, "Sport"]  # access just the "Sport" column by name
the_df["Sport"]    # returns a one column data.frame
class(the_df["Sport"])   # check class of the one column data frame
the_df[["Sport"]]  # access just the "Sport" column,
# this returns a (factor) vendor
class(the_df[["Sport"]])
the_df[, "Sport", drop = FaLSE]
class(the_df[, "Sport", drop = FaLSE])
the_df[, 3, drop = FaLSE]

# factors are stored specially. To see how its represented in data.frame form,
# use model.matrix to create a set of
# indicator variables. That is one column for each level of a factor, with a
# 1 if a row contains that level or
# a 0 otherwise
new_factor <- factor(c("Pennsylvania", "New York", "New Jersey", "New York",
                       "Tennessee", "Massachusetts", "Pennyslvania",
                       "New York"))
model.matrix(~new_factor - 1)

# 5.2 Lists - a container to hold arbitrary objects of either the same type of
# varying type
#
# creates a 3 element list
list(1, 2, 3)

# creates a single element list where the only element is a vector that has 3
# elements
list(c(1, 2, 3))

# creates a 2 element list, the 1st element is a 3 element vector, the 2nd
# element is a give element vector
list3 <- list(c(1, 2, 3), 3:7)

# two element list, 1st element is a data.frame, 2nd element is a 10 element
# vector
list(the_df, 1:10)

# 3 element list, 1st is a data.frame, 2nd is a vector, 3rd is list3, which
# holds 2 vectors
list5 <- list(the_df, 1:10, list3)

# how to access list with names
names(list5)
names(list5) <- c("data.frame", "vector", "list") # assign names
list6 <- list(TheDataFrame = the_df, TheVector = 1:10, TheList = list3)
# assign names during creation
names(list6)

# creating an empty list
empty_list <- vector(mode = "list", length = 4)

# access individual elements of a list, use double square brackets, specifying
# either the element number of name
list5[[1]]
list5[["data.frame"]]

# once an element is accessed, it can be treated as if that actual element is
# being used, allowing nesting
# indexing of elements
list5[[1]]$Sport
list5[[1]][, "Second"]
list5[[1]][, "Second", drop = FaLSE]

# it is also possible to append elements to a list simply by using an index
# (either numeric or names) that does not exist
length(list5)
list5[[4]] <- 2 # add a 4th element, unnamed
list5[["NewElement"]] <- 3:6

# caUTION/bEST PRacTIcES: Occassionally appending to a list or vector or
# data.frame for that matter is fine.
# but doing so repeatedly is computationally expensive. It is best to create
# a list as long as its final desired size
# and then fill it in using the appropriate indices

# 5.3 Matrices - common mathematical structure that is essential to statistics
# similar to data.frame except that every single element must be the same
# type, commonly all numerics

# create a 5x2 matrix
a <- matrix(1:10, nrow = 5)
b <- matrix(21:30, nrow = 5)
c <- matrix(21:40, nrow = 2)
nrow(a)
ncol(a)
dim(a)

# can use artihmetic on matrix with same dimensions, as well as boolean check
a + b
a * b
a == b

# matrix multiplication requires the number of cols of left hand matrix to be
# the same as number of rows of
# right hand matrix. So a(5x2) and b(5x2) needs b to be transposed first
a %*% t(b)

# matrices can also have names for rows and column
colnames(a)
rownames(a)
colnames(a) <- c("Left", "Right")
rownames(a) <- c("1st", "2nd", "3rd", "4th", "5th")
colnames(b) <- c("First", "Second")
rownames(b) <- c("One", "Two", "Three", "Four", "Five")
colnames(c) <- LETTERS[1:10]  # 2 special vectors, letters and LETTERS
# (lowercase and uppercase respectively)
rownames(c) <- c("Top", "bottom")

# effect of transposing a matrix and multiplying matrices
# transposing naturally flips the row and column names
# matrix multiplication keeps the row names from the left matrix and the
# column names from the right matrix
t(a)
a %*% c

###############################################################################
# 5.4 arrays - a multi-dimensional vector. Must be all of the same type and
# individual elements are accessed
# using square brackets. 1st element is the row index, 2nd elements is the
# column index, and remaining
# elements are for outer dimensions
# Main difference between an array and a matrix is that matrices are restricted
# to 2 dimensions while arrays can
# have an arbitraty number
###############################################################################

thearray <- array(1:12, dim = c(2, 3, 2))
thearray
thearray[1, , ]
thearray[1, , 1]
thearray[, , 1]
